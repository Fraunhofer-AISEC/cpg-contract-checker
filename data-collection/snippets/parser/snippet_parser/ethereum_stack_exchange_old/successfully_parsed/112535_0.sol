pragma solidity ^0.8.0;

contract B {
    function testMsgSender(address supposedMsgSender) public view {
        require(supposedMsgSender == msg.sender, "msg.sender is not the right address");
    }
}

contract A {
    B contractInstance;
    
    constructor(address Baddress)
    {
        contractInstance = B(Baddress);
    }
    
    function test() public view {
        contractInstance.testMsgSender(msg.sender);
    }
}
