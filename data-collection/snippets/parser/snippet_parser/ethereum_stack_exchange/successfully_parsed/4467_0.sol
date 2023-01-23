contract StructExample {

    struct SomeStruct {
        int someNumber;
        string someString;
    }

    SomeStruct[] someStructs;

    function addSomeStruct() {
        SomeStruct storage someStruct = SomeStruct(123, "test");
        someStructs.push(someStruct);
    }
}
