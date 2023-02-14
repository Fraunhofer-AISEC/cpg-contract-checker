contract testStruct {

   uint public structID;

    struct SomeStruct {
        uint[] numbers;
    }

    SomeStruct[] someStructs;

    function store(uint _numbers, uint entryID) public {

        SomeStruct memory someStruct;
        someStructs.push(someStruct);

        someStructs[entryID].numbers.push(_numbers);

        structID++;

    }

    function testRetrieve(uint entryID, uint test) public view returns (uint) {

        return someStructs[entryID].numbers[test];

    }
}
