
pragma solidity ^0.8.7;

contract data_manipulation {

    struct User {
        string first_name;
        string last_name;
        uint256 phone_number;
        string email_address;
        string delivery_address;
    }

    struct Seller {
        string first_name;
        string last_name;
        uint256 phone_number;
        string delivery_address;
    }

    mapping(address => User) public users;
    mapping(address => Seller) public sellers;

    function AddUser(string memory first_name, string memory last_name, uint256 phone_number, string memory email_address, string memory delivery_address) public view{
        User memory user_instance = users[msg.sender];
        user_instance.first_name = first_name;
        user_instance.last_name = last_name;
        user_instance.phone_number = phone_number;
        user_instance.email_address = email_address;
        user_instance.delivery_address = delivery_address;

    }

    

    function set_first_name(string memory first_name_setter) public {
        User memory user_instance = users[msg.sender];
        user_instance.first_name = first_name_setter;
        users[msg.sender] = user_instance;
    }

    function set_last_name(string memory last_name_setter) public {
        User memory user_instance = users[msg.sender];
        user_instance.last_name = last_name_setter;
        users[msg.sender] = user_instance;
    }

    function set_phone_number(uint256 phone_number_setter) public {
        User memory user_instance = users[msg.sender];
        user_instance.phone_number = phone_number_setter;
        users[msg.sender] = user_instance;
    }

    function set_email_address(string memory email_address_setter) public {
        User memory user_instance = users[msg.sender];
        user_instance.email_address = email_address_setter;
        users[msg.sender] = user_instance;
    }    

    function set_delivery_address(string memory delivery_address_setter) public {
        User memory user_instance = users[msg.sender];
        user_instance.delivery_address = delivery_address_setter;
        users[msg.sender] = user_instance;
    }

    

    function get_first_name() public view returns(string memory){
        User memory user_instance = users[msg.sender];
        return user_instance.first_name;

    }

    function get_last_name() public view returns(string memory){
        User memory user_instance = users[msg.sender];
        return user_instance.last_name;

    }

    function get_phone_number() public view returns(uint256){
        User memory user_instance = users[msg.sender];
        return user_instance.phone_number;

    }

    function get_email_address() public view returns(string memory){
        User memory user_instance = users[msg.sender];
        return user_instance.email_address;

    }    

    function get_delivery_address() public view returns(string memory){
        User memory user_instance = users[msg.sender];
        return user_instance.delivery_address;

    }
} 
