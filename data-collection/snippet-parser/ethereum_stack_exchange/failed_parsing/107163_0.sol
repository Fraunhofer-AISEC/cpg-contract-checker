pragma solidity >=0.7.0 <0.9.0;

contract Storage{

    string b = "calculation a";
    struct UserInfo {
        string time;
        string source;
        uint emission;
    }
    mapping (string => UserInfo) users;

    the function of saving data is ignored
    
    function search(string memory input_source) public view returns (uint, string memory) {
        return (users[input_source].emission, users[input_source].time);
    }
}
