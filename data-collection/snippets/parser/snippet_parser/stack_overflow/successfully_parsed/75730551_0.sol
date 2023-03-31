 
pragma solidity ^0.8.11;

contract SimpleContractB {
  function example1() public returns(bool, bytes memory) {
    (bool isSuccess, bytes memory data) = address(msg.sender).call{ value: 1 ether }("");
    return (isSuccess, data);
  }

  function example2() pure public {
    revert("Demo internal transaction error!");
  }

  function example3() payable public {
    assert(msg.value > 1 ether);
  }

  function example4() payable public {
    require(
      msg.value > 1 ether,
      "Not enough Ether provided."
    );
  }
}
