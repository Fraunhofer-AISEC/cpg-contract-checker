contract StructExample {

    struct SomeStruct {
        int someNumber;
        string someString;
    }

    SomeStruct someStruct;
    SomeStruct[] someStructs;

    function addSomeStruct() {
        someStruct = SomeStruct(123, "test");
        someStructs.push(someStruct);
    }
}
