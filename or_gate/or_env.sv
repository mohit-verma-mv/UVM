class or_env extends uvm_env;
  
  `uvm_component_utils(or_env)
  
  or_agt agt;
  or_sb sb;
  
  function new(string name = "or_env", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb = or_sb::type_id::create("sb",this);
    agt = or_agt::type_id::create("agt",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.or_ap.connect(sb.or_ip);
  endfunction
  
  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    uvm_top.print_topology();
  endfunction
  
endclass