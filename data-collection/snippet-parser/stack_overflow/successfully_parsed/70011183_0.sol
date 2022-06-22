

pragma solidity ^0.6.0;

contract SimpleStorage {
    uint256 favNum;
    
    struct People {
        uint256 favNum;
        string name;
    }
    
    People[] public people;
    
    function store(uint256 _favNum) public {
        favNum = _favNum;
    }
    
    function retrieve() public view returns(uint256) {
        return favNum;
    }
    
    function addPerson(string memory _name, uint256 _favNum) public {
        people.push(People(_favNum, _name));
    }
}
