pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

contract C {
    struct Friends {
        string name;
    }
    
    struct Person {
        string name;
        Friends[] friends;
    }
    
    mapping(string => Person) persons;
    
    function map(string memory _name, string[] memory _friends_names) public {
        persons[_name].name = _name;
        
        uint256 length = _friends_names.length;
        for (uint256 i = 0; i < length; i+=1) {
            persons[_name].friends.push(Friends(_friends_names[i]));
        }
    }
    
    function returnSingleStruct(string memory _name) public view returns(string memory, string[] memory) {
        uint256 length = persons[_name].friends.length;
        string[] memory friends_names = new string[](length);
        for (uint i = 0; i < length; i+=1) {
            friends_names[i] = persons[_name].friends[i].name;
        }
        
        return (persons[_name].name, friends_names);
    }
}
