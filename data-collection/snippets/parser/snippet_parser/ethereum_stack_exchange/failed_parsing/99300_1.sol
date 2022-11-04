pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;



import "https://github.com/lukso-network/standards-implementations/blob/master/contracts/_LSPs/ILSP1_UniversalReceiver.sol"; 

import "https://github.com/lukso-network/standards-implementations/blob/master/contracts/_LSPs/ILSP1_UniversalReceiverDelegate.sol"; 


import "erc725/contracts/ERC725/ERC725Account.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v3.x/contracts/introspection/ERC165.sol"; 

contract LSP3Account is ERC165, ERC725Account, ILSP1 {
