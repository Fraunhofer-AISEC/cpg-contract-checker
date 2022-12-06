pragma solidity ^0.4.24; 


contract Aion {
    uint256 public serviceFee;
    function ScheduleCall(uint256 blocknumber, address to, uint256 value, uint256 gaslimit, uint256 gasprice, bytes data, bool schedType) public payable returns (uint,address);

}


contract MyContract{
    uint256 public sqrtValue;
    Aion aion;
    address public owner;
    address public myAionaddress;
    uint256 public schId;
    constructor() public{
        owner = msg.sender;
    }

    function scheduleMyfucntion(uint256 transferAmount, address to) public {
        aion = Aion(0xFcFB45679539667f7ed55FA59A15c8Cad73d9a4E);
        bytes memory data = abi.encodeWithSelector(bytes4(keccak256('transfer(uint256)')),to,transferAmount); 
        uint callCost = 200000*1e9 + aion.serviceFee();
        (schId,myAionaddress) = aion.ScheduleCall.value(callCost)( block.timestamp + 1 days, address(this), 0, 200000, 1e9, data, true);
    }

    function transfer(uint256 transferAmount, address to) public {
        require(msg.sender == owner || msg.sender == myAionaddress);
        to.transfer(transferAmount);    
    } 

    function () public payable {}

}
