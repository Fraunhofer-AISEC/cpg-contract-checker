contract Storage{
   
    string b = "calculation a";
    struct UserInfo {
        string time;
        string source;
        uint emission;
    }
    mapping (string => UserInfo) users;
    
    function set(string memory input_time, string memory input_source, string memory input_mycalculate, uint input_material) public {
        users[input_source].time = input_time;
        if (keccak256(abi.encodePacked(input_mycalculate)) == keccak256(abi.encodePacked(b)))
            users[input_source].emission = input_material * 3 / 2;
        else
            users[input_source].emission = input_material * 5 / 2;
    }
    
    function search(string memory input_source) public view returns (uint, string memory) {
        return (users[input_source].emission, users[input_source].time);
    }
}
