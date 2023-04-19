
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {RegistryDeployer} from "../src/RegistryDeployer.sol";

contract RegistryDeployerTest is Test {

  
  event Deployed();
  
  
  

  function testDeployer() public {
    vm.expectEmit(true, true, true, true);
    emit Deployed();
    new RegistryDeployer();
  }
}
