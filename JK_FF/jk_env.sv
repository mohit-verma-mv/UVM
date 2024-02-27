class jk_env extends uvm_env;
  
  `uvm_component_utils(jk_env)
  
  jk_agt agt;
  jk_scb sb;
  
  function new(string name = "jk_env", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = jk_agt::type_id::create("agt",this);
    sb = jk_scb::type_id::create("sb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.jk_ap.connect(sb.jk_ip);
  endfunction
  
  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    uvm_top.print_topology();
  endfunction
  
endclass