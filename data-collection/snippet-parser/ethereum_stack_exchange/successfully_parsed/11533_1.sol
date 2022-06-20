contract D { 
    uint[] myArray;
    function Test() constant returns (uint[]) {
       myArray.push(123); 
       return myArray;
    }
}
