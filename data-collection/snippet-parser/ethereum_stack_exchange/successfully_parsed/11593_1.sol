contract Test {

    struct Struct {
      uint[] myArray;
    }

    Struct myStruct; 

    function Test()  {
        myStruct.myArray.push(1);
        myStruct.myArray.push(2);
        myStruct.myArray.push(3);
    }

    function getter(uint index) returns(uint value) {
        return myStruct.myArray[index];
    }

}
