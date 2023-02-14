
pragma solidity >=0.4.22 <0.9.0;

struct customer {
   uint256 amount;
}

contract Lottery {
    address payable public admin;
    address payable[] public add;
    mapping(address => customer) public data;
   
  function getBalance() public view onlyOwner returns (uint256) {
     return address(this).balance/1 ether;
    }
    
      
  function getter() view public returns (uint)
  {
   return add.length;
  }

}