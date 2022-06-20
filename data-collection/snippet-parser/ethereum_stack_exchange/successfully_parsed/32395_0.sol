pragma solidity ^0.4.14;


contract AdminSetUp {   
address private creator = msg.sender;
address[] public adminlist;
uint public count;


modifier onlyCreator {  
    if (msg.sender == creator)
    _;
}

function addMember(address _newadmin) public onlyCreator returns (uint) {
    adminlist.push(_newadmin);
    count = adminlist.length;
    return count;
 }



}
