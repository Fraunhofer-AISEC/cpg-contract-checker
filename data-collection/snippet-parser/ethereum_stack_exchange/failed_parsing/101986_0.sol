pragma solidity ^0.6.0;

abstract contract AionClient {

constructor(address addraion) public{
   address AionAddress = addraion;
}


function execfunct(address to, uint256 value, uint256 gaslimit, bytes 
calldata data) external 
payable returns(bool, bytes memory) {
    require(msg.sender == address(0));
    return to.call.value(value).gas(gaslimit)(data);
    
}
}
function executeCall(uint256 blocknumber, address from, address to, 
uint256 value, uint256 gaslimit, uint256 gasprice,
uint256 fee, bytes calldata data, uint256 aionId, 
bool schedType) external {

require(msg.sender==_owner);
    
    if(schedType) require(blocknumber <= block.timestamp);
    if(!schedType) require(blocknumber <= block.number);
    
    require(keccak256(abi.encodePacked(scheduledCalls[aionId]))
    ==keccak256(abi.e ncodePacked(blocknumber,from, to, value, gaslimit, 
    gasprice, fee, data, schedType)));
    AionClient instance = AionClient(clientAccount[from]);
    require(bool);

require(instance.execfunct(address(this),2100,gaslimit,hex"00"));
