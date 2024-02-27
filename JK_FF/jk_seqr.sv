class jk_seqr extends uvm_sequencer#(jk_xtn);
  
  `uvm_component_utils(jk_seqr)
  
  function new(string name = "jk_seqr", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass