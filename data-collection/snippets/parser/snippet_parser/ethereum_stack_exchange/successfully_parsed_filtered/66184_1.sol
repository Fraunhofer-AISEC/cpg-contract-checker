pragma solidity >=0.4.21 <0.6.0;

import "./Addresses.sol";

contract AddressesTests {
using Addresses for address;

function testIsContract() public {
    
  
    assert(address(this).isContract());
    assert(!msg.sender.isContract());
   }
 }
