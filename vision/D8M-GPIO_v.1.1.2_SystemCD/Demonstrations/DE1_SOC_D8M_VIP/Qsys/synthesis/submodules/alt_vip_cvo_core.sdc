# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


proc alt_vip_get_timequest_name {hier_name} {
	set sta_name ""
	for {set inst_start [string first ":" $hier_name]} {$inst_start != -1} {set inst_start [string first ":" $hier_name $inst_start]} {
		incr inst_start
		set inst_end [string first "|" $hier_name $inst_start]
		if {$inst_end == -1} {
			append sta_name [string range $hier_name $inst_start end]
		} else {
			append sta_name [string range $hier_name $inst_start $inst_end]
		}
	}
	return $sta_name
}

proc alt_vip_get_core_instance_list {corename} {
	set full_instance_list [alt_vip_get_core_full_instance_list $corename]
	set instance_list [list]

	foreach inst $full_instance_list {
		set sta_name [alt_vip_get_timequest_name $inst]
		if {[lsearch $instance_list $sta_name] == -1} {
			lappend instance_list $sta_name
		}
	}
	return $instance_list
}

proc alt_vip_get_core_full_instance_list {corename} {
	set instance_list [list]

	# Look for a keeper (register) name
	# Try mem_clk[0] to determine core instances
	set search_list [list "*"]
	set found 0
	for {set i 0} {$found == 0 && $i != [llength $search_list]} {incr i} {
		set pattern [lindex $search_list $i]
		set instance_collection [get_keepers -nowarn "*|${corename}:*|$pattern"]
		if {[get_collection_size $instance_collection] == 0} {
			set instance_collection [get_keepers "${corename}:*|$pattern"]
		}
		if {[get_collection_size $instance_collection] > 0} {
			set found 1
		}
	}
	# regexp to extract the full hierarchy path of an instance name
	set inst_regexp {(^.*}
	append inst_regexp ${corename}
	append inst_regexp {:[A-Za-z0-9\.\\_\[\]\-\$()]+)\|}
	foreach_in_collection inst $instance_collection {
		set name [get_node_info -name $inst]
		if {[regexp -- $inst_regexp $name -> hier_name] == 1} {
			if {[lsearch $instance_list $hier_name] == -1} {
				lappend instance_list $hier_name
			}
		}
	}
	return $instance_list
}

set corename "alt_vip_cvo_core"
set instance_list [alt_vip_get_core_instance_list $corename]

foreach inst $instance_list {
    set_multicycle_path -setup -start -through [get_nets "${inst}|mode_banks|u_calculate_mode_dynamic|*"] 2
    set_multicycle_path -hold -start -through [get_nets "${inst}|mode_banks|u_calculate_mode_dynamic|*"] 1
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_interlaced_field[*]"]    
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_interlaced_field[*]"]    
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_interlaced"]             
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_h_total_minus_one[*]"]      
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_v_total_minus_one[*]"]      
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_h_blank[*]"]                
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_h_sync_start[*]"]           
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_h_sync_end[*]"]             
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f2_v_start[*]"]             
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f1_v_start[*]"]             
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f1_v_end[*]"]               
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f2_v_sync_start[*]"]        
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f2_v_sync_end[*]"]          
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f1_v_sync_start[*]"]        
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f1_v_sync_end[*]"]          
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f_rising_edge[*]"]          
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f_falling_edge[*]"]         
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f1_v_end_nxt[*]"]           
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f2_anc_v_start[*]"]         
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_f1_anc_v_start[*]"]         
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_h_sync_polarity"]        
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_v_sync_polarity"]        
    set_false_path -to [get_keepers "${inst}|rst_vid_clk_reg"]

    # The following may not exist to be applied to
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_standard[*]"]
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_serial_output[*]"]          
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_ap_line[*]"]                
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_ap_line_end[*]"]            
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_sav[*]"]                    
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_sof_sample[*]"]             
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_sof_line[*]"]               
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_sof_subsample[*]"]          
    set_false_path -to [get_keepers "${inst}|mode_banks|vid_vcoclk_divider_value[*]"]   
}

############################################################################
# False path the clock crossing write and read pointers
############################################################################
#set fifo_wr_ptrs [get_keepers *cvo*_common_fifo:*dcfifo*delayed_wrptr_g[*]]
#set fifo_dgwps   [get_keepers *cvo*_common_fifo:*dcfifo*rs_dgwp*]
#foreach_in_collection wr_ptr $fifo_wr_ptrs {
#    foreach_in_collection dgwps $fifo_dgwps {
#        set_false_path -from $wr_ptr -to $dgwps
#    }
#}

#set fifo_rd_ptrs [get_keepers *cvo*_common_fifo:*dcfifo*rdptr_g[*]]
#set fifo_dgrp [get_keepers *cvo*_common_fifo:*dcfifo*ws_dgrp*]
#foreach_in_collection rd_ptr $fifo_rd_ptrs {
#    foreach_in_collection dgrp $fifo_dgrp {
#        set_false_path -from $rd_ptr -to $dgrp
#    }
#}

############################################################################
# alt_vip_common_sync has embedded SDC commands so no longer constrained in this file
############################################################################



set_false_path -to   [get_pins -compatibility_mode *cvo_core*rst_vid_clk*clrn]
#set_false_path -from [get_pins -compatibility_mode *cvo_core*mode_banks*vid_h_total*]
