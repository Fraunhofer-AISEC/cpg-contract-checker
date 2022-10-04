pragma solidity ^0.4.17;
contract PersonalInfo{
    address public userAddress;
    address[] public Users;
    string public email;
    string public userName;


    function PersonalInfo ()public{
        userAddress = msg.sender;
        Users.push(userAddress);
    }
    function SavePersonalInfo(string Name, string Email)public{
        userName = Name;
        email = Email;
    }


}
