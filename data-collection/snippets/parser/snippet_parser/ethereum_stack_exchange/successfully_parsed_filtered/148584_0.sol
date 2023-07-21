
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract EthDistributor {
using SafeMath for uint256;

address[] private transactions;
uint256 public transactionSize = 5000000000000000; 
uint256 private transactionCount = 0;

event PaymentReceived(address indexed _from, uint256 _value);
event PaymentSplit(uint256 indexed _amount, uint256 indexed _count);

function recordTransaction() public payable {
require(msg.value >= transactionSize, "Transaction value too small");
require(tx.origin == msg.sender, "Proxy contract not allowed");

transactions.push(msg.sender);
transactionCount = transactionCount.add(1);
transactionSize = transactionSize.mul(101).div(100); 

emit PaymentReceived(msg.sender, msg.value);

if (transactionCount == 10) {
uint256 balance = address(this).balance;
uint256 splitAmount = balance.div(transactions.length);
for (uint256 i = 0; i < transactions.length; i++) {
payable(transactions[i]).transfer(splitAmount);
}
transactionCount = 0;
emit PaymentSplit(splitAmount, transactions.length);
}
}
}
