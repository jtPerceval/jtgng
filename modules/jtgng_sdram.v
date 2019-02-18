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
    Date: 7-1-2018 */

// Each read takes 8 clock cycles
// clk should be 8*clk_slow

module jtgng_sdram(
    input               rst,
    input               clk, // 96MHz = 32 * 6 MHz -> CL=2  
    output              loop_rst,  
    input               autorefresh,
    input               read_req,    // read strobe
    output reg  [15:0]  data_read,
    input       [21:0]  sdram_addr,
    // ROM-load interface
    input               downloading,
    input               prog_we,    // strobe
    input       [21:0]  prog_addr,
    input       [15:0]  prog_data,    
    // SDRAM interface
    inout       [15:0]  SDRAM_DQ,       // SDRAM Data bus 16 Bits
    output reg  [12:0]  SDRAM_A,        // SDRAM Address bus 13 Bits
    output              SDRAM_DQML,     // SDRAM Low-byte Data Mask
    output              SDRAM_DQMH,     // SDRAM High-byte Data Mask
    output              SDRAM_nWE,      // SDRAM Write Enable
    output              SDRAM_nCAS,     // SDRAM Column Address Strobe
    output              SDRAM_nRAS,     // SDRAM Row Address Strobe
    output              SDRAM_nCS,      // SDRAM Chip Select
    output      [ 1:0]  SDRAM_BA,       // SDRAM Bank Address
    output              SDRAM_CKE       // SDRAM Clock Enable     
);

localparam  CMD_LOAD_MODE   = 4'b0000, // 0 
            CMD_AUTOREFRESH = 4'b0001, // 1 
            CMD_PRECHARGE   = 4'b0010, // 2
            CMD_ACTIVATE    = 4'b0011, // 3 
            CMD_WRITE       = 4'b0100, // 4
            CMD_READ        = 4'b0101, // 5
            CMD_STOP        = 4'b0110, // 6
            CMD_NOP         = 4'b0111, // 7
            CMD_INHIBIT     = 4'b1000; // 8

assign SDRAM_DQMH = 1'b0;
assign SDRAM_DQML = 1'b0;
assign SDRAM_BA   = 2'b0;
assign SDRAM_CKE  = 1'b1;

reg SDRAM_WRITE;
reg [15:0] write_data;
assign SDRAM_DQ =  SDRAM_WRITE ? write_data : 16'hzzzz;            

reg [8:0] col_addr;

reg [3:0] SDRAM_CMD;
assign {SDRAM_nCS, SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE } = SDRAM_CMD;

reg [13:0] wait_cnt;
reg [2:0] cnt_state, init_state;
reg       initialize;

reg write_cycle=1'b0, write_req=1'b0;

assign loop_rst = initialize;

wire readon  = !downloading && (read_req || autorefresh);
wire writeon = downloading && prog_we;

reg autorefresh_cycle;

always @(posedge clk)
    if( rst ) begin
        // initialization of SDRAM
        SDRAM_WRITE<= 1'b0;
        SDRAM_CMD <= CMD_NOP;
        wait_cnt   <= 14'd9750; // wait for 100us
        initialize <= 1'b1;
        init_state <= 3'd0;
        // Main loop
        cnt_state  <= 3'd3; //Starts after the precharge
            // 0,1,4,5,6,7 fails
            // 3 SCROLL is chunky
            // 2 SCROLL very chunky
    end else if( initialize ) begin
        if( |wait_cnt ) begin
            wait_cnt <= wait_cnt-14'd1;
            SDRAM_CMD <= CMD_NOP;
        end else begin
            if(!init_state[2]) init_state <= init_state+3'd1;
            case(init_state)
                3'd0: begin
                    SDRAM_CMD  <= CMD_PRECHARGE;
                    SDRAM_A[10]<= 1'b1; // all banks
                    wait_cnt   <= 14'd1;
                end
                3'd1: begin
                    SDRAM_CMD <= CMD_AUTOREFRESH;
                    wait_cnt  <= 14'd10;
                end
                3'd2: begin
                    SDRAM_CMD <= CMD_LOAD_MODE;
                    SDRAM_A   <= 13'b00_1_00_010_0_000; // CAS Latency = 2
                    wait_cnt  <= 14'd2;
                end
                3'd3: begin
                    SDRAM_CMD  <= CMD_PRECHARGE;
                    SDRAM_A[10]<= 1'b1; // all banks
                    wait_cnt   <= 14'd1;
                end
                3'd4: initialize <= 1'b0;
                default:;
            endcase
        end
    end else  begin // regular operation
        if( cnt_state!=3'd2 || 
            readon || /* when not downloading */
            writeon   /* when downloading */) 
            cnt_state <= cnt_state + 3'd1;
        case( cnt_state )
        3'd0,3'd1,3'd3,3'd5,3'd6: begin // wait
            SDRAM_CMD <= CMD_NOP;
        end
        3'd2: begin // activate or refresh
            write_data  <= prog_data;
            if( writeon ) begin
                SDRAM_CMD <= CMD_ACTIVATE;
                { SDRAM_A, col_addr } <= prog_addr[21:0];
                autorefresh_cycle <= 1'b0;
                write_cycle       <= 1'b1;
            end 
            if( readon ) begin                
                SDRAM_CMD <= 
                    autorefresh ? CMD_AUTOREFRESH : CMD_ACTIVATE;
                { SDRAM_A, col_addr } <= sdram_addr;                
                autorefresh_cycle <= autorefresh; 
                write_cycle       <= 1'b0;               
            end
        end
        3'd4: begin // set read/write            
            SDRAM_A[12:9] <= 4'b0010; // auto precharge;
            SDRAM_A[ 8:0] <= col_addr;
            SDRAM_WRITE <= write_cycle;
            SDRAM_CMD <= write_cycle ? CMD_WRITE :
                autorefresh_cycle ? CMD_NOP : CMD_READ;
        end
        3'd7: begin
            if(!write_cycle && !autorefresh_cycle) data_read <= SDRAM_DQ;
            write_cycle       <= 1'b0;
            autorefresh_cycle <= 1'b0;
        end
        endcase
    end
endmodule // jtgng_sdram