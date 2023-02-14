pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";



contract EscrowSol is ReentrancyGuard {
    enum State {AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE, REFUND}

    State public currState;

    
    address public funder;
    
    address public beneficiary;

    
    modifier onlyBuyer() {
        require(msg.sender == funder, "Only buyer can call this method");
        _;

    }
        
    constructor (address payable _buyer, address payable _seller) {
        funder = _buyer;
        beneficiary = _seller;
    }
    
    
    
    function fund(address counterpart) onlyBuyer payable external{
        require(currState == State.AWAITING_PAYMENT, "Already Paid");
        currState = State.AWAITING_DELIVERY;
        beneficiary = counterpart;
        funder = msg.sender;
    }

    
    
    function release() onlyBuyer payable external{
        require(currState == State.AWAITING_DELIVERY, "cannot confirm delivery");
        if (msg.sender==funder){
            
            payable(beneficiary).transfer(address(this).balance);
            
        }
        currState = State.COMPLETE;
    }

    function refundBuyer() onlyBuyer external {
        require(currState == State.AWAITING_DELIVERY, "REFUND BUYER");
        payable(funder).transfer(address(this).balance);
        currState = State.REFUND;
    }

    
    
    
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
} ```

Now, i have deployed the contract and tested the fund and release feature, but if i try to fund again, so i can test out the 'refundBuyer', It throws an error on remix. Same thing happens if i did the fund and refund call first, it will go through. But when i try to fund again, it throws the same error below

[![enter image description here][1]][1]


  [1]: https:



Does it mean that buyer can only interact with the contract once ? or there's something i'm missing
