


pragma solidity >=0.7.0 <0.9.0;

contract User {

    address public smart_contract_owner;

    mapping(address => UserDeatils) public dataset;

    struct UserDeatils{
        string owner_name;
        address owner_address;
        uint owner_balance;
        uint owner_isExists;
        uint creation_date;
    }

    function createAccount(string memory name) public isUserAlreadyExists returns(string memory){
        UserDeatils memory userDeatils =  UserDeatils(name, msg.sender, 0, 1, block.timestamp);
        dataset[msg.sender] = userDeatils;
        return "User created successfully";
    }


    modifier isUserAlreadyExists {
        require(dataset[msg.sender].owner_isExists == 0, "User already exists");
        _;
    }

    modifier isNotExists {
        require(dataset[msg.sender].owner_isExists == 1, "User not exists");
        _;
    }

    modifier isNotReceiver {
        require(dataset[msg.sender].owner_isExists == 1, "Receiver not exists");
        _;
    }

    modifier isValueSufficient {
        require(msg.value > 0, "Need to send more than 0 ether");
        _;
    }
}
