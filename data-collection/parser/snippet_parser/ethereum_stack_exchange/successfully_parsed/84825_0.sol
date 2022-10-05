pragma solidity ^0.5.11;

contract A {
    uint256 public lastFundSentToContract = 0;
    
    function updateLastFundSentToContract () public payable {
        lastFundSentToContract = msg.value;
    }
    
    function getContractBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
