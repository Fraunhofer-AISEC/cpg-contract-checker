function _burn(uint index) internal {

  require(index < array.length);

  array[index] = array[array.length-1];
  delete array[array.length-1];

  

  array.length = array.length - 1; 

  array.length = 0;  

  

  array.length = 1;  

  array.length = 2; 

}
