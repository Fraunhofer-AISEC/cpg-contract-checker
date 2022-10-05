pragma solidity ^0.4.24;


contract Aion {
    uint256 public serviceFee;
    function ScheduleCall(uint256 blocknumber, address to, uint256 value, uint256 gaslimit, uint256 gasprice, bytes data, bool schedType) public payable returns (uint,address);

}


contract MyContract{
    Aion aion;

    constructor() public payable {
        scheduleMyfucntion();
    }

    function scheduleMyfucntion() public {
        aion = Aion(0xFcFB45679539667f7ed55FA59A15c8Cad73d9a4E);
        bytes memory data = abi.encodeWithSelector(bytes4(keccak256('myfucntion()')));
        uint callCost = 200000*1e9 + aion.serviceFee();
        aion.ScheduleCall.value(callCost)( block.timestamp + 1 days, address(this), 0, 200000, 1e9, data, true);
    }

    function myfucntion() public {
        
        scheduleMyfucntion();
    }

    function () public payable {}

}
