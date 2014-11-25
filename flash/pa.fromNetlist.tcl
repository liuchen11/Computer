
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name flash -dir "D:/ISE_workspace/Computer/flash/planAhead_run_4" -part xc3s1200efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/ISE_workspace/Computer/flash/flash.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/ISE_workspace/Computer/flash} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "flash.ucf" [current_fileset -constrset]
add_files [list {flash.ucf}] -fileset [get_property constrset [current_run]]
link_design
