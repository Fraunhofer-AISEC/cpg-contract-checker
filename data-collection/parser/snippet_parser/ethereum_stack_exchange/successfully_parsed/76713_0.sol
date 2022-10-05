pragma solidity ^0.5.0;

contract Marketplace {
    string public name;
    address owner;
    uint public fileCount = 0;
    mapping(uint => File) public files; 


    struct File
    {
        uint id;
        string name;
        address owner;
        address sharedWith;
    }

    mapping(uint => Product) public products;

    struct Product {
        uint id;
        string name;
        address owner;
        address sharedWith;
    }

    event ProductCreated(
        uint id,
        string name,
        address owner,
        address sharedWith
    );

    event FileViewed(
        uint id,
        string name,
        address owner,
        address sharedWith
    );


    constructor() public {
        name = "File Sharing System";
        owner = msg.sender;
    }

    modifier onlyOwner()
    {
        require(owner==msg.sender);
        _;
    }

    function addFile(string memory _name, address _address) onlyOwner public
    {
        fileCount++;
        products[fileCount] = Product(fileCount,_name,owner,_address);
        emit ProductCreated(fileCount, _name, owner, _address);
    }

    function viewFile(uint _id) public view
    {
        Product memory _file = products[_id];
        require(msg.sender==_file.sharedWith,"Not shared with you!!");
        emit FileViewed(fileCount, _name, owner, _address);
    }

}
