class jk_drv extends uvm_driver#(jk_xtn);
  
  `uvm_component_utils(jk_drv)
  
  virtual jk_intf vif;
  jk_xtn xtn;
  
  function new(string name = "jk_drv", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    xtn = jk_xtn::type_id::create("xtn");
    if(!uvm_config_db#(virtual jk_intf)::get(this,"","intf",vif))
      `uvm_fatal("DRV:","Cannot get interface from top");
  endfunction
  
  task run_phase(uvm_phase phase);
    forever 
      begin
        `uvm_info("DRV:","From Driver",UVM_NONE);
        seq_item_port.get_next_item(xtn);
        @(posedge vif.clk);
        vif.rst_n <= 1'b1;
        vif.j <= xtn.j;
        vif.k <= xtn.k;
        @(posedge vif.clk);
        //`uvm_info("DRV:",$sformatf("j = %0b, k = %0b",vif.j,vif.k),UVM_NONE);
        //`uvm_info("DRV:",$sformatf("q = %0b, q_bar = %0b",vif.q,vif.q_bar),UVM_NONE);
        xtn.print();
        seq_item_port.item_done();
      end
  endtask
  
endclass