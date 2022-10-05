pragma solidity 0.4.24;

contract Foo {
  
  
  
  function withoutNewS() external {
    uint256[3] storage data;
  }
  
  
  
  function withoutNew() external {
    uint256[3] data;
  }
  
  
  
  function withoutNewM() external {
    uint256[3] memory data;
  }
  
  
  
  function withNewM() external {
    uint256[] memory data = new uint256;
  }
}
