pragma solidity ^0.5.7;

contract CommerceChain {

    
    
    event onNewCategory(uint productId);

    
    
    address owner;

    mapping (uint => Category) categoryMapping;
    uint[] categoryIndex;


    struct Category {
        uint id;
        uint name;
        uint description;
    }


    
    
    modifier isOwner(){
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    modifier notExistsCategory(uint id) {
        require(categoryMapping[id].id != id, "Category already exists");
        _;

    }

    
    
    constructor() public payable {
        owner = msg.sender;
    }

    function() external payable {

    }


    function addCategory(uint id, uint  _name, uint _description) public isOwner notExistsCategory(id) {
        categoryMapping[id] = Category(id, _name, _description);
        categoryIndex.push(id);
        emit onNewCategory(id);
    }
}
