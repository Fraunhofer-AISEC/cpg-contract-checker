pragma solidity ^0.4.16;
import "./Storage.sol";

contract ValidationService {

Storage public store;


 constructor(address add) public{
    store=Storage(add);
 }


 function getMyNumber() public constant returns (uint) {

     return store.getNumber();

 }


}
