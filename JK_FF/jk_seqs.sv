class jk_seqs extends uvm_sequence#(jk_xtn);
  
  `uvm_object_utils(jk_seqs)
  
  jk_xtn xtn;
  
  function new(string name = "jk_seqs");
    super.new(name);
  endfunction
  
  virtual task body();
    xtn = jk_xtn::type_id::create("xtn");
    repeat(10)
      begin
        start_item(xtn);
        assert(xtn.randomize());
        `uvm_info("SEQS:","Data Generated",UVM_NONE);
        xtn.print();
        finish_item(xtn);
      end
  endtask 
  
endclass