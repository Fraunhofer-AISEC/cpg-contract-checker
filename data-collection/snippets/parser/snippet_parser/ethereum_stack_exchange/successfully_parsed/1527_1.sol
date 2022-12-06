uint[] internal array;



function _burn(uint index) internal {
  require(index < array.length);
  array[index] = array[array.length-1];
  array.pop();
}
