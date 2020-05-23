onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/i_DUT/i_clk
add wave -noupdate /top_tb/i_DUT/INST_Datapath/r_sys_data_out
add wave -noupdate /top_tb/i_DUT/INST_Datapath/r_reg_addr
add wave -noupdate /top_tb/i_DUT/i_clk
add wave -noupdate /top_tb/i_DUT/INST_Datapath/INST_SYS_MEM/i_we
add wave -noupdate /top_tb/i_DUT/INST_Datapath/INST_SYS_MEM/i_read_address
add wave -noupdate /top_tb/i_DUT/INST_Datapath/INST_SYS_MEM/i_read_address
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {285 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 160
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {782 ns} {1012 ns}
