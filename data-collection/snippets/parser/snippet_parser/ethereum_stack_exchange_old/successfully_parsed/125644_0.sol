

pragma solidity >=0.7.0 <0.9.0;


contract PayableContract {
    constructor() {} 

    event PaymentReceived(address indexed _sender, uint _before, uint _after);

    function getContractBalance() public view returns (uint256) {
        return address(this).balance; 
    }

    function sendPaymentToContract(uint _amount) payable external 
    {
        uint beforeBalance = getContractBalance();
        payable(address(this)).transfer(_amount);
        uint afterBalance = getContractBalance();
        emit PaymentReceived(msg.sender, beforeBalance, afterBalance);
    }
    
    receive() payable external {}
}
