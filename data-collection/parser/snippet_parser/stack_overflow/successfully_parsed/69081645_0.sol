
pragma solidity >=0.7.0 <0.9.0;

contract Storage{
    
    struct UserInfo {
        uint index;
        string[] time;
        string[] source;
        uint[] emission;
    }
    
    mapping (string => UserInfo) public users;

    function saveStandard(uint input_material, uint weight, string memory input_time, string memory input_source) 
    public returns (string memory, uint, uint, string memory){
    
        uint id = users[input_source].index + 1;
        users[input_source].index = id;
        
        users[input_source].time[id] = input_time;
        uint Combustion = weight * input_material / 10;
        uint Process = weight * input_material / 10;
        users[input_source].emission[id] = Combustion + Process;
        
        return (input_source, Combustion, Process, input_time);
    }
    
    function search(string memory input_source) public view returns (uint, string memory) {
        uint id = 0;
        while (id <= users[input_source].index) {
            id += 1;
            return (users[input_source].emission[id], users[input_source].time[id]);
        }
    }
}
