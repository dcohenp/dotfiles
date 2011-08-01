define name
  print (string)dc_object_get_name($arg0)
end

define set_names
  set $i = 0
  set $set = (set)$arg0
  set $size = $set->size
  while $i < $size
    set $data = set_get_nth($set, $i++)
    set $name = dc_object_get_name($data)
    printf "0x%x \"%s\"\n", $data, $name
  end
end

define etrace
  printf "parent_pin  = %s\n", dc_object_get_name($arg0.parent_pin)
  printf "eqop_net    = %s\n", dc_object_get_name($arg0.eqop_net)
  printf "driver_pin  = %s\n", dc_object_get_name($arg0.driver_pin)
  printf "driver_cell = %s\n", dc_object_get_name($arg0.driver_cell)
  printf "inverted    = %d\n", $arg0.inverted
  printf "is_const    = %d\n", $arg0.is_const
  printf "is_port     = %d\n", $arg0.is_port
end

define rcg
  call cci_eval(dccci_global_interp(), 0, "report_clock_gating")
end

define ccgs
  call cci_eval(dccci_global_interp(), 0, "check_clock_gating_style")
end

define dc
  call cci_eval(dccci_global_interp(), 0, $arg0)
end

define attrs
  set $set_to_report_attributes = set_create()
  call set_add_to_end($set_to_report_attributes, $arg0)
  call rptdc_report_attribute(dc_get_current_design(), 0, 0, 0, 0, 0, 0, 0, 0, 0, $set_to_report_attributes)
  call set_free($set_to_report_attributes)
end

define daemon
  set $daemon_functions = (set)set_create()
  set $daemon_table = dc_daemon_table()
  call cb_get_funcs($daemon_table, $arg0, $daemon_functions)
  set $i = 0
  while $i < $daemon_functions->size
    set $daemon_function = set_get_nth($daemon_functions, $i++)
    x/1 $daemon_function
  end
  call set_free($daemon_functions)
end
