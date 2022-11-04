uint256 length = array.length;
for(uint256 i = 0; i < length;) {
  doSomething(array[i]);
  unchecked{ i++; }
}
