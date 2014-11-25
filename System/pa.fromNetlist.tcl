
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name System -dir "D:/ISE_workspace/Computer/System/planAhead_run_2" -part xc3s1200efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/ISE_workspace/Computer/System/System.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/ISE_workspace/Computer/System} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "System.ucf" [current_fileset -constrset]
add_files [list {System.ucf}] -fileset [get_property constrset [current_run]]
link_design
