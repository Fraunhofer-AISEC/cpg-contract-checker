pragma solidity >0.6.0 >=0.6.0 >0.5 <0.7.1 <=0.7.2;
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
}