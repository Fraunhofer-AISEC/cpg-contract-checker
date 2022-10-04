
pragma solidity ^0.8.4;

contract Test {

    struct Project {
        uint id;
        string name;
        
        Whitelist[] addressList; 
        
    }

    
    Project[] public projects;

    struct Whitelist {
        uint signupDate;
        address userAddress;
    }
    
    Whitelist[] public whitelists;

    function createProject(uint projectId, string memory projectName) public 
    {
        
         Whitelist memory newWhitelist = Whitelist ({
                signupDate: block.timestamp,
                userAddress: msg.sender
            });
        
        whitelists.push(newWhitelist);

        Project memory newProject = Project ({
            id: projectId,
            name: projectName,
            
            addressList: whitelists
        });

        projects.push(newProject);
    }

     function getProjects() public view returns (Project[] memory) {
      
      return projects;
    }

    function getProjectUsers(uint projectId) public view returns (Whitelist[] memory) {
      return projects[projectId].addressList;
    }

}
