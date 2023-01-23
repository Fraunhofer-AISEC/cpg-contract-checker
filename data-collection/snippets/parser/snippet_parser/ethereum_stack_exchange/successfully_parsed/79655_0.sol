pragma solidity ^0.4.24;


contract Aion {
    uint256 public serviceFee;
    function ScheduleCall(uint256 blocknumber, address to, uint256 value, uint256 gaslimit, uint256 gasprice, bytes data, bool schedType) public payable returns (uint,address);

}


contract MyContract{
    uint256 public sqrtValue;
    Aion aion;

    function schedule_rqsr(uint256 number) public {
        aion = Aion(0xFcFB45679539667f7ed55FA59A15c8Cad73d9a4E);
        bytes memory data = abi.encodeWithSelector(bytes4(keccak256('sqrt(uint256)')),number);
        uint callCost = 200000*1e9 + aion.serviceFee();
        aion.ScheduleCall.value(callCost)( block.number+15, address(this), 0, 200000, 1e9, data, false);
    }

    function sqrt(uint256 number) public {
        sqrtValue = number**2;
    }

    function () public payable {}

}
