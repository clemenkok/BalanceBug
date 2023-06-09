// Example instance of the top level module for: 
//     rgb_to_hv
// To include this component in your design, include: 
//     rgb_to_hv.qsys
// in your Quartus project and follow the template 
// below to instantiate the IP.  Alternatively, the IP core 
// can be generated from a Qsys system.

rgb_to_hv rgb_to_hv_inst (
  // Interface: clock (clock end)
  .clock     ( ), // 1-bit clk input
  // Interface: reset (reset end)
  .resetn    ( ), // 1-bit reset_n input
  // Interface: call (conduit sink)
  .start     ( ), // 1-bit valid input
  .busy      ( ), // 1-bit stall output
  // Interface: return (conduit source)
  .done      ( ), // 1-bit valid output
  .stall     ( ), // 1-bit stall input
  // Interface: returndata (conduit source)
  .returndata( ), // 27-bit data output
  // Interface: red (conduit sink)
  .red       ( ), // 8-bit data input
  // Interface: green (conduit sink)
  .green     ( ), // 8-bit data input
  // Interface: blue (conduit sink)
  .blue      ( )  // 8-bit data input
);
