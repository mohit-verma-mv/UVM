class or_seqr extends uvm_sequencer#(or_xtn);
  
  `uvm_component_utils(or_seqr)
  
  function new(string name = "or_seqr", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass