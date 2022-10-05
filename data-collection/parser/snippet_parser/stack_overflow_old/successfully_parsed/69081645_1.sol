
pragma solidity >=0.7.0 <0.9.0;

contract Storage{
    
    struct UserInfo {
        string time;
        string source;
        uint emission;
    }
    
    mapping (string => UserInfo) public users;

    function saveStandard(uint input_material, uint weight, string memory input_time, string memory input_source) 
    public returns (string memory, uint, uint, string memory){
        
        users[input_source].time = input_time;
        uint Combustion = weight * input_material / 10;
        uint Process = weight * input_material / 10;
        users[input_source].emission = Combustion + Process;
        
        return (input_source, Combustion, Process, input_time);
    }
    
    function search(string memory input_source) public view returns (uint, string memory) {
        return (users[input_source].emission, users[input_source].time);
    }
}
