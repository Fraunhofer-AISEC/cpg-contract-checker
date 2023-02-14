pragma solidity ^0.4.11;

contract AuthorizationManager{
    struct User{
      string userId;
      uint roleId;
    }

    mapping (string => User[]) companyUserMap;

    function addUser(string _key,string _userId, uint _roleId){
        companyUserMap[_key].push(User(_userId,_roleId));
    }

    function removeSingleUser(string _key){
        companyUserMap[_key].length--;
    }
}
