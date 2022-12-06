function insertionSort(uint[] a, uint length) internal returns (uint[]) {
  for (uint i = 0; i < length; i++) {
    uint j = i;
    while (j > 0 && a[j] < a[j-1]) {
      uint temp = a[j];
      a[j] = a[j-1];
      a[j-1] = temp;
      j--;
    }
  }
  return a;
}
