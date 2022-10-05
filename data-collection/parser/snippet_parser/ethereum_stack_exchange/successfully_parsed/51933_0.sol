pragma solidity ^0.4.16;

contract ecommerce{

    event OnProductAdd(uint, string, uint);
    event UserInfo(User);

    struct User{
        address _address;
        bytes32 name;
        uint balance;
    }

    struct Product{
        uint id;
        string name;
        uint price;
    } 

    address _owner;

    mapping(address => User) public user;

    Product[] public products;

    modifier isAdmin() {
        require(msg.sender == _owner, "you don't have admin access");
        _;
    }

    constructor() public {
        _owner = msg.sender; 
    } 

    function addProduct(uint _id, string _name, uint _price) isAdmin public {

        products.push(Product({
            id: _id,
            name : _name,
            price : _price
        }));

        emit OnProductAdd(_id, _name, _price);
    }

    function getAllProducts() view public{

       
    }

}
