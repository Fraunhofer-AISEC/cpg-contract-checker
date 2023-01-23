pragma solidity ^0.5.11;

contract Sender {
    event sent(
        address indexed escrowAddress
    );
    
    function sendEth() external payable{
        Escrow escrow = new Escrow();
        
        address payable _payableEscrow = address(uint160(address(escrow)));
        _payableEscrow.transfer(msg.value);
        
        emit sent(_payableEscrow);
    }
}

contract Escrow {
    function getBalance() external view returns(uint256) {
        return address(this).balance;
    }
}
