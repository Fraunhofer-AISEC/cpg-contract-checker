
pragma solidity ^0.8.16;

interface IFACE {
  function foo(string memory s, uint256 n) external;
}

contract MyContract is IFACE {
  function foo(string memory s, uint256 n) external {
    
  }
}

contract Contract {

  address public myContractAddress;

  constructor(address _myContractAddress) {
    myContractAddress = _myContractAddress;
  }

  function test1() public {
    IFACE(myContractAddress).foo("etc", 1);
  }

  function test2() public {
    (bool success, bytes memory data) = myContractAddress.call(
            abi.encodeWithSignature("foo(string,uint256)", "etc", 123));
    
  }

}

