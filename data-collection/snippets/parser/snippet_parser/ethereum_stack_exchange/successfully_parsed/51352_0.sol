pragma solidity ^0.4.24;

contract MyContract {

     
     bytes32[] public MyBytesArray;


     function addItem(bytes32 _item) public {
          MyBytesArray.push(_item) -1;
     }
}
