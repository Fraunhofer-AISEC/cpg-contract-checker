function insertionSort(uint[] a){
 for (uint i = 1;i < a.length;i++){
  uint temp = a[i];
  uint j;
  for (j = i -1; j >= 0 && temp < a[j]; j--)
    a[j+1] = a[j];
  a[j + 1] = temp;
 }
}
