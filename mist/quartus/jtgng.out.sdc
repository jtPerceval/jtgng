## Generated SDC file "jtgng.out.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

## DATE    "Sat Jul 22 10:14:06 2017"

##
## DEVICE  "EP3C25E144C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK_27[0]} -period 37.037 -waveform { 0.000 18.518 } [get_ports {CLOCK_27[0]}]
create_clock -name {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE} -period 1.000 -waveform { 0.000 0.500 } [get_registers {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]
create_clock -name {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ} -period 1.000 -waveform { 0.000 0.500 } [get_registers {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {clk_gen|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {clk_gen|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -divide_by 9 -master_clock {CLOCK_27[0]} [get_pins {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {clk_gen|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {clk_gen|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 4 -divide_by 3 -master_clock {CLOCK_27[0]} [get_pins {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {clk_gen|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {clk_gen|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 3 -master_clock {CLOCK_27[0]} [get_pins {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {clk_gen|altpll_component|auto_generated|pll1|clk[3]} -source [get_pins {clk_gen|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 12 -divide_by 13 -master_clock {CLOCK_27[0]} [get_pins {clk_gen|altpll_component|auto_generated|pll1|clk[3]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.010  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

