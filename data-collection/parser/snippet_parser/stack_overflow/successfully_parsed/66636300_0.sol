pragma solidity ^0.6.0;

contract Parent{
  address[] public children;

  function creteChild (uint256[] memory distro)external payable{
    children.push(address(new Child(msg.sender,distro)));
  }
}

contract Child{
   address payable owner;
   uint256[] distribution;
 
   constructor(address payable admin,uint256[] memory distro)public payable{
    owner=admin;
    distribution=distro;
  }
}
