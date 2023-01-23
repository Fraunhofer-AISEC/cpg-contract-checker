
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";

contract AddressGetterTest is Test {
  AddressGetter public addressGetter;

  function setUp() public {
    address addressToSwapIn = 0x514910771af9ca656af840dff83e8264ecf986ca;

    addressGetter = AddressGetter(HuffDeployer.config().with_addr_constant("MY_ADDRESS", addressToSwapIn).deploy("AddressGetter"))
  }
}

interface AddressGetter {
    function getAddress() external view returns (address);
}

