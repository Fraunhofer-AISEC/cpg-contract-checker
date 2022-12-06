uint DEFAULT_SIZE = 20;
byte256[] arr = new byte256[](DEFAULT_SIZE);

function push(byte256 item) public {
  bool isTimeToResize = arr[arr.length - 1] != 0;
  if (isTimeToResize) {
    byte256[] temp = new byte256[](arr.length + DEFAULT_SIZE);
    arr = copyOldArrayIntoBiggerOne(arr, temp);
  }
} 
