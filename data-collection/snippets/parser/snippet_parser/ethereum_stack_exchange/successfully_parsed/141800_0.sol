pragma solidity ^0.6.0;

contract CustmerAuth {
    uint256 public value;

    constructor() public {}

    struct UserDetail {
        address addr;
        string firstName;
        string lastName;
        string DoB;
        string phone;
        string email;
        string password;
        bool isUserLoggedIn;
        bool isUserRegister;
    }

    mapping(address => UserDetail) user;

    
    function register(
        address _address,
        string memory _firstName,
        string memory _lastName,
        string memory _DoB,
        string memory _Phone,
        string memory _password,
        string memory _email
    ) public returns (bool) {
        
        if (user[_address].isUserRegister == false) {
            require(user[_address].addr != msg.sender);
            user[_address].addr = _address;
            user[_address].firstName = _firstName;
            user[_address].lastName = _lastName;
            user[_address].DoB = _DoB;
            user[_address].phone = _Phone;
            user[_address].password = _password;
            user[_address].email = _email;
            user[_address].isUserLoggedIn = false;
            user[_address].isUserRegister = true;
            return true;
        } else {
            return false;
        }
    }
} 
