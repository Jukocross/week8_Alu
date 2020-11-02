set projDir "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/vivado"
set projName "alu_Building"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/au_top_0.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/reset_conditioner_1.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/button_controller_2.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/counter_3.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/input_fsm_4.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/seven_seg_select_digit_5.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/seven_seg_select_value_6.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/button_conditioner_7.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/edge_detector_8.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/errorChecker_9.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/out_state_fsm_10.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/seven_seg_11.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/pipeline_12.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/alu_13.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/counter_14.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/alufn_signal_fsm_15.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/adderUnit_16.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/booleanUnit_17.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/shifterUnit_18.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/verilog/compareUnit_19.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/alu_Building/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
