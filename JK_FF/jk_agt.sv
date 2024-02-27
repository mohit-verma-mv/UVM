class jk_agt extends uvm_agent;
  
  `uvm_component_utils(jk_agt)
  
  jk_drv drv;
  jk_seqr seqr;
  jk_mon mon;
  
  function new(string name = "jk_agt", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = jk_drv::type_id::create("drv",this);
    seqr = jk_seqr::type_id::create("seqr",this);
    mon = jk_mon::type_id::create("mon",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
endclass