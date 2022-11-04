pragma solidity ^0.4.17;

contract test{

mapping(bytes4 => bool) internal supportedInterfaces;
uint public a;

function test() public{
          supportedInterfaces[this.transferFrom.selector] = true;
  }

  function supportsInterface(bytes4 interfaceID) external view returns (bool) {
        return supportedInterfaces[interfaceID];
  }


  function transferFrom(address _from, address _to, uint256 _tokenId) public{
     a = 1;
  }

  function transferFrom(address _from, address _to, uint256 _tokenId, bytes data) public{
    a = 2;
  }

}
