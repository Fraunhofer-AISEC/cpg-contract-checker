    pragma solidity ^0.4.24;


contract Aion {
    uint256 public serviceFee;
    function ScheduleCall(uint256 blocknumber, address to, uint256 value, uint256 gaslimit, uint256 gasprice, bytes data, bool schedType) public payable returns (uint);


}


contract MyContract{
    Aion aion;

    function scheduleTransaction(uint256 value, uint256 gaslimit, uint256 gasprice, bool time_or_block) public {
        aion = Aion(0xFcFB45679539667f7ed55FA59A15c8Cad73d9a4E);
        uint256 callCost = value + gaslimit*gasprice + aion.serviceFee();
        aion.ScheduleCall.value(callCost)( block.number+15, 0xFcFB45679539667f7ed55FA59A15c8Cad73d9a4E, value, gaslimit, gasprice, hex"00", time_or_block);
    }

    function () public payable {}

}
