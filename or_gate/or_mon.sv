class or_mon extends uvm_monitor;
  
  `uvm_component_utils(or_mon)
 
  or_xtn xtn;
  virtual or_intf vif;
  uvm_analysis_port#(or_xtn) or_ap;
  
  
  function new(string name = "or_mon", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    xtn = or_xtn::type_id::create("xtn");
    or_ap = new("or_ap",this);
    if(!uvm_config_db#(virtual or_intf)::get(this,"","intf",vif))
      `uvm_fatal("MON:","Cannot get config");
  endfunction
  
  task run_phase(uvm_phase phase);
    //`uvm_info("MON:","Run Phase Monitor",UVM_NONE);
    forever 
      begin
        `uvm_info("MON:","Run Phase Monitor",UVM_NONE);
        #1;
        xtn.a = vif.a;
        xtn.b = vif.b;
        #1;
        xtn.c = vif.c;
        xtn.print();
        or_ap.write(xtn);
      end
  endtask
  
endclass