pragma solidity ^0.4.17;
contract PersonalInfo{
    address public userAddress;
    address public manager;
    address[] public Users;  


    modifier restricted (){
        require(msg.sender == manager);
        _;
    }

    function PersonalInfo () public{
        manager = msg.sender;
    }

    function AddUsers()public payable{
        if(msg.sender != manager)
            Users.push(msg.sender);
    }
    function SendUsersArray()public{

    }



}
