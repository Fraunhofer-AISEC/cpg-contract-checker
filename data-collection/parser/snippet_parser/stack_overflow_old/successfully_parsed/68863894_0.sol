pragma solidity >=0.7.0 <0.9.0;

contract Storage{
    string b = "calculation a";
    
    struct UserInfo {
        string time;
        uint emission;
    }
    mapping (string => UserInfo) public users;

    function saveData(string memory input_time, string memory input_source, string memory input_mycalculate, uint input_material) public{
        users[input_source].time = input_time;
        if (keccak256(abi.encodePacked(input_mycalculate)) == keccak256(abi.encodePacked(b)))
            users[input_source].emission = input_material * 3 / 2;
        else
            users[input_source].emission = input_material * 5 / 2;
    }
    
    function search(string memory input_source) public view returns (UserInfo memory) {
        return users[input_source];
    }
} 
