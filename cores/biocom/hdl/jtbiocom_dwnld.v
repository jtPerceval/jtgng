/*  This file is part of JT_GNG.
    JT_GNG program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT_GNG program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT_GNG.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 30-10-2019 */


module jtbiocom_dwnld(
    input                clk,
    input                downloading,
    input      [21:0]    ioctl_addr,
    input      [ 7:0]    ioctl_dout,
    input                ioctl_wr,
    output reg [21:0]    prog_addr,
    output     [15:0]    prog_data,
    output reg [ 1:0]    prog_mask, // active low
    output reg [ 1:0]    prog_ba,
    output reg           prog_we,
    output               prog_rd,
    output     [ 1:0]    prom_we,
    input                sdram_ack,
    input                data_ok,

    input      [15:0]    sdram_dout,
    output reg           dwnld_busy = 1'b0
);

wire         convert;
wire [21:0]  dwnld_addr, obj_addr;
wire [ 7:0]  dwnld_data, obj_data;
wire [ 1:0]  dwnld_mask, obj_mask, dwnld_ba;
wire         dwnld_we, obj_we;
reg  [ 7:0]  pre_data;

reg          last_convert;

assign prog_data = {2{pre_data}};

always @(posedge clk) begin
    last_convert <= convert;
    if( downloading ) begin
        prog_addr <= dwnld_addr;
        pre_data  <= dwnld_data;
        prog_mask <= dwnld_mask;
        prog_we   <= dwnld_we;
        prog_ba   <= dwnld_ba;
        dwnld_busy<= 1'b1;
    end else if(convert) begin
        prog_addr <= obj_addr;
        pre_data  <= obj_data;
        prog_mask <= obj_mask;
        prog_we   <= obj_we;
        prog_ba   <= 2'b11;
    end else begin
        prog_we   <= 1'b0;
        prog_mask <= 2'b11;
        if(last_convert) begin
            `ifdef SIMULATION
            $display("INFO: Rom conversion finished. %t",$time);
            `endif
            dwnld_busy<= 1'b0;
        end
    end
end

jtbiocom_prom_we u_prom_we(
    .clk         (  clk          ),
    .downloading (  downloading  ),
    .ioctl_addr  (  ioctl_addr   ),
    .ioctl_dout  (  ioctl_dout   ),
    .ioctl_wr    (  ioctl_wr     ),
    .prog_addr   (  dwnld_addr   ),
    .prog_data   (  dwnld_data   ),
    .prog_mask   (  dwnld_mask   ),
    .prog_we     (  dwnld_we     ),
    .prog_ba     (  dwnld_ba     ),
    .prom_we     (  prom_we      ),
    .sdram_ack   (  sdram_ack    )
);

jtgng_obj32 #(
    .OBJ_START ( 22'h10_0000 ),
    .OBJ_END   ( 22'h12_0000 ))
u_obj32(
    .clk         (  clk          ),
    .downloading (  downloading  ),
    .sdram_dout  (  sdram_dout   ),
    .convert     (  convert      ),
    .prog_addr   (  obj_addr     ),
    .prog_data   (  obj_data     ),
    .prog_mask   (  obj_mask     ), // active low
    .prog_we     (  obj_we       ),
    .prog_rd     (  prog_rd      ),
    .sdram_ack   (  sdram_ack    ),
    .data_ok     (  data_ok      )
);

endmodule