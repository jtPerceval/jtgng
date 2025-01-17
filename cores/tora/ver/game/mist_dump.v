`timescale 1ns/1ps

module mist_dump(
    input           VGA_VS,
    input           led,
    input   [31:0]  frame_cnt
);

`ifdef DUMP
`ifndef NCVERILOG // iVerilog:
    initial begin
        // #(200*100*1000*1000);
        $display("DUMP enabled");
        $dumpfile("test.lxt");
    end
    `ifdef DUMP_START
    always @(negedge VGA_VS) if( frame_cnt==`DUMP_START ) begin
    `else
        initial begin
    `endif
        $display("DUMP starts");
        `ifdef DEEPDUMP
            $dumpvars(0,mist_test);
        `else
            $dumpvars(1,mist_test.UUT.u_game.u_main);
            $dumpvars(1,mist_test.UUT.u_game.u_rom);
            $dumpvars(1,mist_test.UUT.u_game);
            $dumpvars(0,mist_test.UUT.u_game.u_dwnld);
            $dumpvars(0,mist_test.UUT.u_frame.u_board.u_sdram);
        `endif
        $dumpon;
    end
`else // NCVERILOG
    `ifdef DUMP_START
    always @(negedge VGA_VS) if( frame_cnt==`DUMP_START ) begin
    `else
    initial begin
    `endif
        $shm_open("test.shm");
        `ifdef DEEPDUMP
            $display("NC Verilog: will dump all signals");
            $shm_probe(mist_test,"AS");
        `else
            $display("NC Verilog: will dump selected signals");
            //$shm_probe(UUT.u_game.u_video.u_obj,"AS");
            $shm_probe(frame_cnt);
            //$shm_probe(UUT.u_game,"A");
            $shm_probe(UUT.u_game.u_main,"A");
            $shm_probe(UUT.u_game.u_main.u_dtack,"A");
            //$shm_probe(UUT.u_game.u_video,"AS");
            //$shm_probe(UUT.u_game.u_mcu,"A");
            //$shm_probe(UUT.u_game.u_dwnld,"AS");
            //$shm_probe(UUT.u_frame.u_board.u_sdram,"A");
            //$shm_probe(UUT.u_game.u_sound,"A");
            //$shm_probe(UUT.u_game.u_sound.u_adpcmcpu,"A");
            //$shm_probe(UUT.u_game.u_sound.u_adpcmcpu.u_adpcm,"AS");
            //$shm_probe(UUT.u_game.u_sound.u_fmcpu,"A");
            //$shm_probe(UUT.u_game.u_sound.u_fm0,"A");
            //$shm_probe(UUT.u_game.u_sound.u_fm0.u_jt12.u_timers,"AS");
            //$shm_probe(UUT.u_game.u_sound.u_fm0.u_jt12.u_mmr,"AS");
            //$shm_probe(UUT.u_game.u_sound.u_fm1.u_jt12.u_mmr,"AS");
            //$shm_probe(UUT.u_game.u_sound.u_fm1,"A");
        `endif
    end
`endif
`endif

endmodule // mist_dump