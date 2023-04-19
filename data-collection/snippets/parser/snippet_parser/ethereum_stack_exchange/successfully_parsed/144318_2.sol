
pragma solidity ^0.8.0;

contract Arbitrage {
address owner;

address public lastMsgSender;
address public lastTxOrigin;
bool public OKAY = false;

constructor() {
    owner = msg.sender;
}

modifier onlyOwner{
    require(owner == msg.sender || owner == tx.origin);
    _;
}

function execute() internal {
    OKAY = true;

}

function receiveCall() external  {
    lastMsgSender = msg.sender;
    lastTxOrigin = tx.origin;
    execute();
}

function triggerCall(address target) external onlyOwner returns(bool) {
    
    (bool success, ) = target.call(abi.encodeWithSignature("flashLoan()"));
    return success;
  }
}
