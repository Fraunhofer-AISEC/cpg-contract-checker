pragma solidity ^0.8.4;

contract B {
    address payable contract_owner;
    uint256 wei_received;
    
   constructor () payable {
    contract_owner = payable (msg.sender);
    wei_received = msg.value;
    } 

    function getReceipt() public view returns (uint256) {
        return wei_received;
    }
}
