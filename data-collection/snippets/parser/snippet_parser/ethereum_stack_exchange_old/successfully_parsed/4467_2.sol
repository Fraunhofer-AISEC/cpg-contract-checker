contract StructExample {

    struct SomeStruct {
        int someNumber;
        string someString;
    }

    SomeStruct[] someStructs;

    function addSomeStruct() {
        SomeStruct memory someStruct = SomeStruct(123, "test");
        someStructs.push(someStruct);
    }
}
