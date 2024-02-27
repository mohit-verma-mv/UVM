class or_xtn extends uvm_sequence_item;
  
  `uvm_object_utils(or_xtn)
  
  rand bit a;
  rand bit b;
  logic c;
  
  constraint a_con {a dist {0:=50, 1:=50};}
  constraint b_con {b dist {0:=50, 1:=50};}
  
  function new(string name = "or_xtn");
    super.new(name);
  endfunction
  
  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field("a",this.a,1,UVM_BIN);
    printer.print_field("b",this.b,1,UVM_BIN);
    printer.print_field("c",this.c,1,UVM_BIN);
  endfunction
  
endclass