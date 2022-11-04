pragma solidity ^ 0.4.24;


import "./foreignContract.sol";

contract myContract {

 foreignContract created;
 constructor() public payable {
  created = new foreignContract();
 }

 function changeNameMycontract(string name) public returns(bool) {
  return created.changeName(name);

 }

 function ReturnName() public view returns(string) {
  return created.receiveName();
 }

}
 contract foreignContract {
 string name;


 function changeName(string Name) public returns(bool) {
  name = Name;
  return true;
 }

 function receiveName() public view returns(string) {
  return name;
 }
}
