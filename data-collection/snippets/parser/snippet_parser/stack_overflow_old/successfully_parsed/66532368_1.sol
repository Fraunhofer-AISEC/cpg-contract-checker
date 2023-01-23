
pragma solidity >=0.6.0 <0.8.0;

pragma experimental ABIEncoderV2;

contract Todolist {
  string[][] lists;
  mapping (address => uint) public ownerToListId;
  mapping (address => bool) ownerHasList;

  function addToList(string calldata item) external{
    if (!ownerHasList[msg.sender]) {
      
      lists.push([item]);
      ownerToListId[msg.sender] = lists.length - 1;
    } else {
      lists[ownerToListId[msg.sender]].push(item);
    }
  }

  function getList() external view returns(string[] memory) {
    return lists[ownerToListId[msg.sender]];
  }
}
