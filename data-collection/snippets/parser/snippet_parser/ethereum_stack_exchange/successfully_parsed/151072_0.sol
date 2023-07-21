
pragma solidity ^0.8.18;

contract Unknown {
    struct User{
        string name;
        address walletAddress;
        uint256 phoneNumber;
        UserAddress[] addresses;
        uint256 addressCount;
    }

    User[] public allUsers;
    Products[] public allProducts;

    struct Products{
        string name;
        string description;
        string price;
        string[] images;
    }

    struct UserAddress{
        string name;
        string streetName;
        string city;
        string state;
        string country;
        uint256 pincode;
    }
    
    mapping(address => User) public walletAddressToUser;
    mapping(address => Products[]) walletAddressToUserBoughtProducts;
    mapping(address => Products[]) walletAddressToUserOnSaleProducts;
    mapping(address => Products[]) ProductsInCard;

    function listUser(string memory _name, uint256 _phoneNumber) public {
        User storage user = allUsers.push();
        user.name = _name;
        user.phoneNumber= _phoneNumber;
        user.walletAddress = msg.sender;
        allUsers.push(user);
        walletAddressToUser[msg.sender] = user;
    }

}
