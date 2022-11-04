pragma solidity ^0.5.11;

contract A { 
   address addressB;
   function setAddresssB(address _addressB) public{ 
       addressB = _addressB;
   }
}

contract B {
  function getEthToTokenInputPrice(uint256 eth_sold) external view returns (uint256 tokens_bought) ;
  }

