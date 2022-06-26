pragma solidity >0.6.0;
contract Storage {
 address payable private owner;
 uint256 number;
 constructor() {
  owner = msg.sender;
 }
 function store(uint256 num) public {
  number = num;
 }
 function retrieve() public view returns (uint256){
  return number;
 }

 function close() public {
  selfdestruct(owner);
 }

  function protectedClose() public {
   require(msg.sender == owner);
   selfdestruct(owner);
  }
}