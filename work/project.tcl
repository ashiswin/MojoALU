set projDir "/home/arroyo/mojo/alu/work/planAhead"
set projName "ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/arroyo/mojo/alu/work/verilog/mojo_top_0.v" "/home/arroyo/mojo/alu/work/verilog/reset_conditioner_1.v" "/home/arroyo/mojo/alu/work/verilog/testerFSM_2.v" "/home/arroyo/mojo/alu/work/verilog/multi_seven_seg_3.v" "/home/arroyo/mojo/alu/work/verilog/alu_4.v" "/home/arroyo/mojo/alu/work/verilog/counter_5.v" "/home/arroyo/mojo/alu/work/verilog/seven_seg_6.v" "/home/arroyo/mojo/alu/work/verilog/decoder_7.v" "/home/arroyo/mojo/alu/work/verilog/adder_8.v" "/home/arroyo/mojo/alu/work/verilog/boolean_9.v" "/home/arroyo/mojo/alu/work/verilog/shifter_10.v" "/home/arroyo/mojo/alu/work/verilog/compare_11.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "/home/arroyo/Downloads/mojo-ide-B1.3.6/library/components/mojo.ucf" "/home/arroyo/Downloads/mojo-ide-B1.3.6/library/components/io_shield.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
