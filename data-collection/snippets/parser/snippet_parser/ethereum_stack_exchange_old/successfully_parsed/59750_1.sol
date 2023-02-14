pragma solidity ^0.4.24;


contract Aion {
uint256 public serviceFee;
function ScheduleCall(uint256 blocknumber, address to, uint256 value, uint256 gaslimit, uint256 gasprice, bytes data, bool schedType) public payable returns (uint);
function cancellScheduledTx(uint256 blocknumber, address from, address to, uint256 value, uint256 gaslimit, uint256 gasprice,
                     uint256 fee, bytes data, uint256 aionId, bool schedType) external returns(bool);

}


contract MyContract{
Aion aion;
address aionAccount;

function scheduleTransaction(uint256 value, uint256 gaslimit, uint256 gasprice, bool time_or_block) public {
    aion = Aion(0xD916EdFd054E1c0fE8e0979DF3818bd60313Bc62); 
    uint256 callCost = value + gaslimit*gasprice + aion.serviceFee();
    uint256 txId;
    (txId,aionAccount) = aion.ScheduleCall.value(callCost)(block.number+15, address(this), value, gaslimit, gasprice,hex"00",time_or_block);
}

function () public payable {}

}
