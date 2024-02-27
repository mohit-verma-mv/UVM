class jk_scb extends uvm_scoreboard;
  
  `uvm_component_utils(jk_scb)
  
  uvm_analysis_imp #(jk_xtn,jk_scb) jk_ip;
  
  jk_xtn xtn;
  
  jk_xtn cov_xtn;
  
  logic q;
  
  function new(string name = "jk_scb", uvm_component parent);
    super.new(name,parent);
    jk_ip = new("jk_ip",this);
    jk_cg = new();
  endfunction
  
  covergroup jk_cg;
    
    option.per_instance = 1;
    
    coverpoint cov_xtn.j {
      bins j1[] = {0,1};}
    
    coverpoint cov_xtn.k {
      bins k1[] = {0,1};}
    
  endgroup
  
  function void write(jk_xtn xtn1);
    xtn = xtn1;
    
    /*if(xtn.j == 0 && xtn.k == 0)
      q = xtn.q;
    else if (xtn.j == 0 && xtn.k == 1)
      q = 0;
    else if (xtn.j == 1 && xtn.k == 0)
      q = 1;
    else if(xtn.j == 1 && xtn.k == 1) 
      q = xtn.q;*/
    
    //reference model logic 
    case({xtn.j,xtn.k})
      2'b00: q = xtn.q;
      2'b01: q = 1'b0;
      2'b10: q = 1'b1;
      2'b11: q = xtn.q;
    endcase
    
    if(xtn.q === q)
      begin
        `uvm_info("SCB:","TEST PASSED",UVM_NONE);
        `uvm_info("SCB:",$sformatf("Expected Data: q = %0b , Actual Data: xtn.q = %0b",q,xtn.q),UVM_NONE);
      end
    else
      begin
        `uvm_error("SCB:","TEST FAILED",UVM_NONE);
        `uvm_info("SCB:",$sformatf("Expected Data: q = %0b , Actual Data: xtn.q = %0b",q,xtn.q),UVM_NONE);
      end
    
    cov_xtn = xtn;
    jk_cg.sample();
  endfunction
  
endclass