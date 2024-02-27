class or_test extends uvm_test;
  
  `uvm_component_utils(or_test)
  
  or_env env;
  or_seqs seqs;
  //or_seq2 seqs;
  
  
  function new(string name = "or_test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = or_env::type_id::create("env",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    //seqs = or_seq2::type_id::create("seqs");
    seqs = or_seqs::type_id::create("seqs");
    seqs.start(env.agt.seqr);
    #1;
    phase.drop_objection(this);
  endtask
  
endclass