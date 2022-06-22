
pragma solidity >=0.7.0 <0.9.0;

import "./TestReceived.sol";

contract TestCaller {
    
    
    constructor()  payable {
        
    }
    
    function callme_recieved_test_1(TestReceived testReceived) public returns (bool ret) {
    
         ret  = payable(address(testReceived)).send(1 ether);
        
    }
    
   
    function callme_recieved_test_2(TestReceived testReceived) public returns (bool ret) {
    
        ( ret,)  = address(testReceived).call{value: 1 ether}("");
        
    }
    
    
    function getBalance() public view returns (uint balance) {
        
        return address(this).balance;
    }
    
}
