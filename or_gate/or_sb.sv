class or_sb extends uvm_scoreboard;
  
  `uvm_component_utils(or_sb)
  
  uvm_analysis_imp #(or_xtn,or_sb) or_ip;
  
  or_xtn xtn;
  
  or_xtn cov_xtn;  //for_coverage
  
  logic c;
  
  covergroup or_cg;
    
    option.per_instance = 1;
    
    coverpoint cov_xtn.a {
      bins a1[] = {0,1};}
    
    coverpoint cov_xtn.b {
      bins b1[] = {0,1};}
    
  endgroup
  
  function new(string name = "or_sb", uvm_component parent);
    super.new(name,parent);
    or_ip = new("or_ip",this);
    or_cg = new();
    //cov_xtn = or_xtn::type_id::create("cov_xtn");
  endfunction
  
  function void write(or_xtn xtn1);
    xtn = xtn1;
    c = xtn.a | xtn.b;
    if(xtn.c == c)
      begin
        `uvm_info("SCB:","TEST_PASSED",UVM_NONE);
        `uvm_info("SCB:",$sformatf("Expected Data: c = %0b, Actual Data: C = %0b",xtn.c,c),UVM_NONE);
      end
    else
      begin
        `uvm_error("SCB:","TEST_FAILED");
        `uvm_info("SCB:",$sformatf("Expected Data: c = %0b, Actual Data: C= %0b",xtn.c,c),UVM_NONE);
      end
    
    cov_xtn = xtn;
    or_cg.sample();
  endfunction
  
  /*task run_phase(uvm_phase phase);
    forever
      begin
        cov_xtn = xtn;
        or_cg.sample();
      end
  endtask*/
  
endclass