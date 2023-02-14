contract FirstContract {

    bool isOne;
    bool isTwo;
    bool isThree;

    function foo(bytes32 _value) returns (uint errorCode) {

        if (!isOne) return 101;
        if (!isTwo) return 102;
        if (!isThree) return 103;

        if (SecondContract("0x222").bar(_value) != 0) return 201;

        
        
        

        if (ThirdContract("0x333").baz(_value) != 0) return 301;

        return 0;
    }
}

contract SecondContract {

    uint num;
    bytes32 value;

    function bar(bytes32 _value) returns (uint errorCode) {
        if (num < 10) return 1;
        value = _value;
        return 0;
    }
}

contract ThirdContract {

    bool isActive;
    bytes32 value;

    function baz(bytes32 _value) returns (uint errorCode) {
        if (!isActive) return 1;
        value = _value;
        return 0;
    }
}
