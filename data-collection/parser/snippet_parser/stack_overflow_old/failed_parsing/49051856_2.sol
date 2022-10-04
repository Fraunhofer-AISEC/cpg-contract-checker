string element = myArray[index];
for (uint i = index; i < myArray.length - 1; i++) {
  myArray[i] = myArray[i + 1];
}
delete myArray[myArray.length - 1];
myArray.length--;
return element;
