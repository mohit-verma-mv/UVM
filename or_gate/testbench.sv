`include "uvm_macros.svh"
import uvm_pkg::*;

`include "or_intf.sv"
`include "or_xtn.sv"
`include "or_seqs.sv"
`include "or_drv.sv"
`include "or_seqr.sv"
`include "or_mon.sv"
`include "or_agt.sv"
`include "or_sb.sv"
`include "or_env.sv"
`include "or_test.sv"

module top;
  
  or_intf vif();
  
  or_gate DUT (.a(vif.a),
               .b(vif.b),
               .c(vif.c));
  
  initial
    begin
      uvm_config_db#(virtual or_intf)::set(null,"*","intf",vif);
      run_test("or_test");
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
  
endmodule