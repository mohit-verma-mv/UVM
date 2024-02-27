class or_drv extends uvm_driver#(or_xtn);
  
  `uvm_component_utils(or_drv)
  
  virtual or_intf vif;
  or_xtn xtn;
  
  function new(string name = "or_drv", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    xtn = or_xtn::type_id::create("xtn");
    if(!uvm_config_db#(virtual or_intf)::get(this,"","intf",vif))
      `uvm_fatal("DRV:","Cannot get config");
  endfunction
  
  task run_phase(uvm_phase phase);
    //`uvm_info("DRV:","Run Phase Driver",UVM_NONE);
    forever
      begin
        `uvm_info("DRV:","Run Phase Driver",UVM_NONE);
        seq_item_port.get_next_item(xtn);
        vif.a <= xtn.a;
        vif.b <= xtn.b;
        #2;
        xtn.print();
        seq_item_port.item_done();
      end
  endtask

endclass