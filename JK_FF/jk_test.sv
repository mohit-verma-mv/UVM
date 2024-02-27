class jk_test extends uvm_test;
  
  `uvm_component_utils(jk_test)
  
  jk_env env;
  jk_seqs seqs;
  
  function new(string name = "jk_test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = jk_env::type_id::create("env",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    `uvm_info("TEST:","OBJECTION RAISED",UVM_NONE);
    phase.raise_objection(this);
    seqs = jk_seqs::type_id::create("seqs");
    seqs.start(env.agt.seqr);
    #1;
    phase.drop_objection(this);
    `uvm_info("TEST:","OBJECTION DROPPED",UVM_NONE);
  endtask
  
endclass