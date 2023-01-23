pragma solidity ^0.8.0;
contract DepositRefund {
    
    mapping(address => uint) public DepositedAmounts;
    
    receive() external payable{
        DepositedAmounts[msg.sender] += msg.value;
    }       
    function refund() public{
        payable(msg.sender).call{value : DepositedAmounts[msg.sender]}("");
        DepositedAmounts[msg.sender] = 0;
    }
}
