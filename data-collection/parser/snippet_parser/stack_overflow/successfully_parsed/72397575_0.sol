pragma solidity ^0.8.11;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract PaymentProcessor {
   address public owner;
   IERC20 public token;

constructor(address _owner, address _token) {
    owner = _owner;
    token = IERC20(_token);
}

event PaymentCompleted(
    address payer,
    uint256 amount,
    uint paymentId,
    uint timestamp
);

function approveTokens(uint256 amount) public returns(bool){
   token.approve(owner, amount);
   return true;
}

function getAllowance() public view returns(uint256){
    return token.allowance(msg.sender, owner);
}

function acceptPayment(uint256 amount, uint paymentId) payable public {
    require(amount > getAllowance(), "Please approve tokens before transferring");
    token.transfer(owner, amount);

    emit PaymentCompleted(msg.sender, amount, paymentId, block.timestamp);
}

}
