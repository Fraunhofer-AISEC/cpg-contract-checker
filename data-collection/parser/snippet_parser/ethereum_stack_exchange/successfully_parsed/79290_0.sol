pragma solidity >=0.4.22 <0.6.2;

contract Item{

    uint id;
    uint items;
    uint startDate;
    uint endDate;
    bool isValid;

    address public owner;

    constructor() public {
        owner = msg.sender;
        isValid = false;
    }

    modifier restricted() {
        require(
            msg.sender == owner,
            "Only owner can call this."
        );
        _;
    }

    function createItem(uint _id,  uint _startDate, uint _endDate, uint _items, bool _isValid) public {
        id = _id;
        startDate = _startDate;
        endDate = _endDate;
        items = _items;
        isValid = _isValid;
    }

    function validateItem() public {
        isValid = true;
    }

    function getItemData() public view returns (uint, uint, uint, uint, bool) {
        return (id, startDate, endDate, items, isValid);
    }

    function getId() public view returns (uint) {    
        return id;    
    } 

    function getItems() public view returns (uint) {    
        return items;    
    } 

    function getStartDate() public view returns (uint) {    
        return startDate;    
    } 

    function getEndDate() public view returns (uint) {    
        return endDate;    
    } 

    function isValidItem() public view returns (bool) {    
        return isValid;    
    } 

}



