string element = myArray[index];
myArray[index] = myArray[myArray.length - 1];
delete myArray[myArray.length - 1];
myArray.length--;
return element;
