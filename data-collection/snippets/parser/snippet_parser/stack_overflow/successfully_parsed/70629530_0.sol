
pragma solidity ^0.8.0;

contract Loo {
    Foo foo;

    function callWithInstance(address payable _t, uint a, uint b) public payable returns(uint) {
        foo = Foo(_t);
        return foo.bar(a,b);
    }
    
    function callWithEncodeSignature(address _t, uint a, uint b) public returns(uint) {
       bytes memory data = abi.encodeWithSignature("bar(uint, uint)", a, b);
        (bool success, bytes memory returnData) = _t.call( data);
        require(success);
        uint c = abi.decode(returnData, (uint));
        return c;
    }

    function callWithEncode(address _t, uint a, uint b) public returns(uint) {
        (bool success, bytes memory returnData) = _t.call( bytes4(keccak256("bar(uint, uint)")), a, b);
        require(success);
        uint c = abi.decode(returnData, (uint));
        return c;
    }
    
}

contract Foo {
    function bar(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
}
