class or_agt extends uvm_agent;
  
  `uvm_component_utils(or_agt)
  
  or_drv drv;
  or_seqr seqr;
  or_mon mon;
  
  function new(string name = "or_agt", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv  =   or_drv::type_id::create("drv",this);
    seqr = or_seqr::type_id::create("seqr",this);
    mon  =   or_mon::type_id::create("mon",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
endclass