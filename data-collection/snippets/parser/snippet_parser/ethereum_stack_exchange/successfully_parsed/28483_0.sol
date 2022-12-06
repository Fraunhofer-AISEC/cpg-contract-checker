    contract Factory {
    function createContract () returns (address){
        address newContract = new test(msg.sender);
        return newContract;
    } 
}

contract test {
 address public creator;
    function test (address _creator){
    creator=_creator;
    }
}
