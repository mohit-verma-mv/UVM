class jk_xtn extends uvm_sequence_item;
  
  `uvm_object_utils(jk_xtn)
  
  rand bit j;
  rand bit k;
  bit rst_n;
  logic q;
  logic q_bar;
  
  constraint j_con {j dist {0:=50, 1:=50};}
  constraint k_con {k dist {0:=50, 1:=50};}
  
  function new(string name = "jk_xtn");
    super.new(name);
  endfunction
  
  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field("rst_n",this.rst_n,1,UVM_BIN);
    printer.print_field("j",this.j,1,UVM_BIN);
    printer.print_field("k",this.k,1,UVM_BIN);
    printer.print_field("q",this.q,1,UVM_BIN);
    printer.print_field("q_bar",this.q_bar,1,UVM_BIN);
  endfunction
  
endclass