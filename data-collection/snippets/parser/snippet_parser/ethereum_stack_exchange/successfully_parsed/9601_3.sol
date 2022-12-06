  struct Foo{
    uint x;
  }
  mapping(uint => Foo[]) mapping_array;

  function add(uint id, uint _x) public {
    mapping_array[id].push(Foo(_x));
  }

  function get(uint id, uint index) public returns(uint){
    return mapping_array[id][index].x;
  }

  function delete_(uint id) public {
    delete mapping_array[id];
  }

  function delete_items(uint id, uint index) public {
    delete mapping_array[id][index];
  }
