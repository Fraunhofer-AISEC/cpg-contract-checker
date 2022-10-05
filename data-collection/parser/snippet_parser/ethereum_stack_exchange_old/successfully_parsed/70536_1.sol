contract Contract {

  struct Simple {
      int a;
      int b;
  }

  Simple[] public array;

  function add(Simple[] memory _array) public {
    for(uint i=0; i<_array.length; i++){
        array.push(_array[i]);
    } 
  }

}
