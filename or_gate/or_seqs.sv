class or_seqs extends uvm_sequence#(or_xtn);
  
  `uvm_object_utils(or_seqs)
  
  or_xtn xtn;
  
  function new(string name = "or_seqs");
    super.new(name);
  endfunction
  
  virtual task body();
    xtn = or_xtn::type_id::create("xtn");
    repeat(4)
      begin
        start_item(xtn);
        assert(xtn.randomize());
        `uvm_info("SEQS:","Data Generated",UVM_NONE);
        xtn.print();
        finish_item(xtn);
      end
  endtask
  
endclass

class or_seq2 extends or_seqs;
  
  `uvm_object_utils(or_seq2)
  
  function new(string name = "seq2");
    super.new(name);
  endfunction
  
  virtual task body();
    xtn = or_xtn::type_id::create("xtn");
    //repeat(2)
      begin
        start_item(xtn);
        assert(xtn.randomize() with {a==0;b==1;});
        `uvm_info("SEQS:","Data Generated",UVM_NONE);
        xtn.print();
        finish_item(xtn);
      end
  endtask 
  
endclass