  function map_insert(){
    for(uint i = 0; i < 10; i++)
      for(uint j = 0; j < 10; j++)
        add(i, i*10 + j);
  }

  function map_remove_map(){
    for(uint i = 0; i < 10; i++)
      delete_(i);
  }

  function map_remove_map_item(){
    for(uint i = 0; i < 10; i++)
      for(uint j = 0; j < 10; j++)
        delete_items(i, j);
  }

  function get_map_address(uint id) {
    uint addr;
    Foo[] a = foo[id];

    assembly{
    addr := a
        }
    map_address = addr;
  }

  function get_map() constant returns (uint){
    return map_address;
  }

  function try_() constant returns (uint ){
    uint addr = map_address;
    Foo[] a;
    assembly{
    a := addr
        }
    return a[1].x;  
  }
