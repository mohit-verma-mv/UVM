`include "uvm_macros.svh"
import uvm_pkg::*;

`include "jk_intf.sv"
`include "jk_xtn.sv"
`include "jk_seqs.sv"
`include "jk_drv.sv"
`include "jk_seqr.sv"
`include "jk_mon.sv"
`include "jk_agt.sv"
`include "jk_scb.sv"
`include "jk_env.sv"
`include "jk_test.sv"

module top;
  
  jk_intf vif();
  
  
  JK_flipflop DUT (.clk(vif.clk),
                   .rst_n(vif.rst_n),
                   .j(vif.j),
                   .k(vif.k),
                   .q(vif.q),
                   .q_bar(vif.q_bar));
                   
  initial 
    begin
      vif.clk = 0;
      forever #5 vif.clk = ~vif.clk;
    end
                   
  initial 
    begin 
      uvm_config_db#(virtual jk_intf)::set(null,"*","intf",vif);
      run_test("jk_test");
    end
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
  
endmodule 