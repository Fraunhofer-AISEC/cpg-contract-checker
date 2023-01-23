
pragma solidity ^0.8.0;
contract Deed {
    address payable public beneficiary;
    address public lawyer;
    uint public earliest;
    uint public amount;
    uint constant public  PAYOUTS = 10;
    uint constant public  INTERVAL = 10;
    uint public paidPayouts;

    constructor(address payable _beneficiary, address _lawyer, uint offset) payable {
        beneficiary = _beneficiary;
        lawyer = _lawyer;
        earliest = block.timestamp + offset;
        amount = msg.value / PAYOUTS;
    }

    function withdraw() external {
        require(msg.sender == lawyer, "only laywer can withdraw");
        require(block.timestamp >= earliest, "you can only withdraw after a specific period specified by the contract");
        require(paidPayouts < PAYOUTS, "no payouts left");
        uint elligiblePayouts = (block.timestamp - earliest) / INTERVAL;
        uint duePayouts = elligiblePayouts - paidPayouts;
        paidPayouts += duePayouts;
        beneficiary.transfer(duePayouts * amount);
        
    }
}
