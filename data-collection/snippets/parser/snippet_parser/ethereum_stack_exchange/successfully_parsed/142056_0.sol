pragma solidity ^0.8.0;

contract Test {    

struct Object {
        uint256 id;
        string title;
        string description;        
    }

    mapping(uint256 => Object) objects;
    uint256 count;

    function create(string memory _title, string memory _description) public {
        require(bytes(_title).length > 0, "title must be set");
        
        objects[count] = Object(count, _title, _description);
        count++;
    }

    function search(uint256 _id) public view returns (string memory, string memory){
        return (objects[_id].title, objects[_id].description);
    }
}
