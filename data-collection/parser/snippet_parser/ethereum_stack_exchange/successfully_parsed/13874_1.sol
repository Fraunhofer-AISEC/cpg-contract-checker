 pragma solidity ^0.4.4;
 import "delegateReceiever.sol";

contract delegateCall{
uint public testInt;
address public sender;

function delegateCall(){
    testInt = 1;
}

function delegateCallC(address _c, uint _testInt){
if(_c.delegatecall(bytes4(sha3("setTestInt(uint")),_testInt ))
throw;
}  
}
