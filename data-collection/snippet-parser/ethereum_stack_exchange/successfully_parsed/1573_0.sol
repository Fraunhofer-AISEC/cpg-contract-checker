  Foo[] public foos;

  struct Foo {
    uint fooX;
    uint[] fooArray;
  }

  function insertionSort(uint[] a)internal {
   for (uint i = 1;i < a.length;i++){
    uint temp = a[i];
    uint j;
    for (j = i -1; j >= 0 && temp < a[j]; j--)
      a[j+1] = a[j];
    a[j + 1] = temp;
   }
  }

  function doesntWork(uint num,uint _id){
    Foo f = foos[_id];
    f.fooArray[f.fooArray.length++] = nun;
    instertionSort(f.fooArray);
  }

  function work1(uit _id){
    Foo f = foos[_id];
    instertionSort(f.fooArray);
  }

  function work2(uint price,uint pair_id){
    Foo p = pairs[pair_id];
    p.boPrices[p.boPrices.length++] = price;
  }
