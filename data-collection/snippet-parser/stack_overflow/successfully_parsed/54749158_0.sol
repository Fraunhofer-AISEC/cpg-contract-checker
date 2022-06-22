pragma solidity ^0.4.23;


contract A{
    address public owner;  
    uint256 counter = 0;

    event addrLog(address _addr, uint256 _counter);

    function getaddr() public returns(address addr){
        addr = address(this);
        owner = addr;


        emit addrLog(owner, ++counter);
    }
}

contract B{
    address public owner; 
    
    

    address public testAddr;
    bytes4 public messageId;
    bool public r1;
    bool public r2;

    constructor(address _addressOfCalltest) public {
        testAddr = _addressOfCalltest;
    }

    function testCall() public returns(bool){
        messageId = bytes4(keccak256("getaddr()"));
        return testAddr.call(messageId);
    }

    function testDelegatecall() public returns(bool){
        messageId = bytes4(keccak256("getaddr()"));
        return testAddr.delegatecall(messageId);
    }

    function run() public{
        r1 = testCall();
        r2 = testDelegatecall();
    }
}
