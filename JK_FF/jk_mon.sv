class jk_mon extends uvm_monitor;
  
  `uvm_component_utils(jk_mon)
  
  jk_xtn xtn;
  virtual jk_intf vif;
  uvm_analysis_port#(jk_xtn) jk_ap;
  
  function new(string name = "jk_mon", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    xtn = jk_xtn::type_id::create("xtn");
    jk_ap = new("jk_ap",this);
    if(!uvm_config_db#(virtual jk_intf)::get(this,"","intf",vif))
      `uvm_fatal("MON","Cannot get virtual interface");
  endfunction
  
  task run_phase(uvm_phase phase);
    forever
      begin
        //@(posedge vif.clk);
        `uvm_info("MON:","From Monitor",UVM_NONE);
        @(posedge vif.clk);
        xtn.rst_n = vif.rst_n;
        xtn.j = vif.j;
        xtn.k = vif.k;
        @(posedge vif.clk);
        //@(posedge vif.clk);
        xtn.q = vif.q;
        xtn.q_bar = vif.q_bar;
        xtn.print();
        jk_ap.write(xtn);
      end
  endtask
  
endclass