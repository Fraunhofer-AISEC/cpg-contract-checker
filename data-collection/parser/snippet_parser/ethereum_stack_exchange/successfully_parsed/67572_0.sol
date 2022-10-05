pragma solidity ^0.5.3;

contract SimpleFallback{
    event FallbackCalledEvent(bytes data);
    event AddEvent(uint a, uint b, uint result);
    event DoubleEvent(uint a, uint b);
    event GetNameEvent(string);

    function() external{
        emit FallbackCalledEvent(msg.data);
    }

    function add(uint a, uint b) public returns(uint){
        
        
        

        uint _result = a + b;
        emit AddEvent(a, b, _result);

        return _result;
    }

    function double(uint a) public returns(uint){
        
        
        uint _result = 2*a;

        emit DoubleEvent(a, _result);

        return _result;
    }

    function getName(string memory name) public returns(string memory){
        emit GetNameEvent(name);

        return name;
    }
}


contract RunTest{


    function callAddlTest(address other) public {
        
        
        other.call(abi.encodeWithSignature("add(uint,uint)", 85, 60));
    }

    function callDoublelTest(address other) public {
        
        
        other.call(abi.encodeWithSignature("double(uint)", 100));
    }

    function callgetNameTest(address other) public{
        other.call(abi.encodeWithSignature("getName(string)", "hello"));
    }
}
