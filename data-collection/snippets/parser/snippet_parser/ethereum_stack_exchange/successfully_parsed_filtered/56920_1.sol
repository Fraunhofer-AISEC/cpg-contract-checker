pragma solidity ^0.4.24;

contract game {

    struct User
    {
        string name;
        
        
        
        
        
        uint level;
        uint score;
    }

    mapping(uint => User[]) mulUsers;

    function addUsers (string _name, uint _level, uint _score) public {
        User memory user = User(_name,_level,_score); 
        mulUsers[_level].push(user);
    }

    
    function getUsers (uint _level) public view returns (bytes32[] users)
    {
        uint length = mulUsers[_level].length;
        users = new bytes32[](length);

        for(uint i = 0; i < length; i++)
        {
            users[i] = stringToBytes32(mulUsers[_level][i].name);
        }   
    }

    
    function stringToBytes32(string memory source) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }
}
