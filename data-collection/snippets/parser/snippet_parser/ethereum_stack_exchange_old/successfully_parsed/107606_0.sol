pragma solidity ^0.4.17; 

contract Details {
    
    
    uint public projcount = 0;    
    
    struct Projects {
        string projectname;
        string description;
    }

    
    mapping (address => Projects[]) public Proj;
       
    
    function createProject (string memory _projectname, string memory _description) public {
        Proj[msg.sender][projcount].projectname = _projectname;
        Proj[msg.sender][projcount].description = _description;
        projcount++;
    }
    
    
    function getProject (address _addr, uint _id) public view returns (string, string) {
        return (Proj[_addr][_id].projectname, Proj[_addr][_id].description);
    } 
}
