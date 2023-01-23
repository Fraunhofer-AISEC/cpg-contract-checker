
contract ExampleStorage {
    uint public _value;
    uint public _value2;
}


contract ExampleDispatcher is ExampleStorage, Dispatcher {    

    function ExampleDispatcher(address target) 
        Dispatcher(target) {
    }

    function initialize() {
        _sizes[bytes4(sha3("getUint()"))] = 32;
        _sizes[bytes4(sha3("getValues()"))] = 32 + 32;
    }
}


contract IExample {
    function getUint() returns (uint);
    function getValues() returns (uint256 v1, uint256 v2);
    function setUint(uint value);
}


contract ExampleV1 is ExampleStorage, IExample, Upgradeable {

    function ExampleV1() {}

    function initialize() {
        _sizes[bytes4(sha3("getUint()"))] = 32;
        _sizes[bytes4(sha3("getValues()"))] = 32 + 32;
    }

    function getUint() returns (uint) {
        return _value;
    }

    function getValues() returns (uint256 v1, uint256 v2) {
        v1 = _value;
        v2 = 2;
    }

    function setUint(uint value) {
        _value = value;
    }
}


contract ExampleV2 is ExampleStorage, IExample, Upgradeable {    

    function ExampleV2() {}

    function initialize() {
        _sizes[bytes4(sha3("getUint()"))] = 32;
        _sizes[bytes4(sha3("getValues()"))] = 32 + 32;
        _sizes[bytes4(sha3("newVar()"))] = 32;
    }

    function getUint() returns (uint) {
        return _value + 10;
    }

    function getValues() returns (uint256 v1, uint256 v2) {
        v1 = 100;
        v2 = _value;
    }

    function setUint(uint value) {
        _value = value;
    }
}
