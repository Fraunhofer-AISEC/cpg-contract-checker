
pragma solidity ^0.8.18;

contract Unknown {
    struct User{
        string name;
        address walletAddress;
        uint256 phoneNumber;
        uint256 addressCount;
        uint256 productOnSaleCount;
    }

    User[] public allUsers;
    Products[] public allProducts;

    struct Products{
        string name;
        string description;
        uint256 price;
        string[] images;
        uint256 imagesCount;
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
    mapping(address => UserAddress[]) public walletAddressToUserAddresses;
    mapping(address => Products[]) walletAddressToUserBoughtProducts;
    mapping(address => Products[]) walletAddressToUserOnSaleProducts;
    mapping(address => Products[]) ProductsInCard;

    function listUser(string memory _name, uint256 _phoneNumber, string memory _addrName,string memory _streetName, string memory _city, string memory _state, string memory _country, uint256 _pincode ) public {
        require(walletAddressToUser[msg.sender].walletAddress == address(0), "User already Listed");
        User storage user = walletAddressToUser[msg.sender];
        user.name = _name;
        user.phoneNumber= _phoneNumber;
        user.walletAddress = msg.sender;
        walletAddressToUser[msg.sender] = user;
        UserAddress storage userAddress = walletAddressToUserAddresses[msg.sender][walletAddressToUser[msg.sender].addressCount];
        userAddress.name = _addrName;
        userAddress.streetName = _streetName;
        userAddress.city = _city;
        userAddress.state = _state;
        userAddress.country = _country;
        userAddress.pincode = _pincode;
        walletAddressToUser[msg.sender].addressCount++;
    }

    function listProductOnSale(string memory _name, string memory _decription, uint256 _price, string memory _imageUrl) public {
        Products storage product = walletAddressToUserOnSaleProducts[msg.sender][walletAddressToUser[msg.sender].productOnSaleCount];
        product.name = _name;
        product.description = _decription;
        product.price = _price;
        product.images[product.imagesCount] = _imageUrl;
        product.imagesCount++;
        walletAddressToUser[msg.sender].productOnSaleCount++;
    }

}```
