

pragma solidity ^0.8.0;

contract CrowdFunding{
    struct Project{
        uint256 totalCollated;
        address[] contributors;
        address owner;
        uint256 dateCreated;
        uint256[] contributions;
        string description;
        string name;
        uint256 totalNeeded;

    }

    mapping(uint256 => Project) public projects;

    mapping(address => uint256) public giveramount;

    mapping(address => string) public contributorNames;

    uint256 public totalProjects = 0;


    function createProject(address _owner, string memory _name, string memory _description, uint256 _dateCreated, uint256 _totalNeeded) public returns (uint256, address, string memory, string memory, uint256, uint256, uint256){
        Project storage newProject = projects[totalProjects];
        newProject.owner = _owner;
        newProject.name = _name;
        newProject.description = _description;
        newProject.dateCreated = _dateCreated;
        newProject.totalNeeded = _totalNeeded;
        newProject.totalCollated = 0;


        totalProjects++;    
        return (totalProjects - 1, newProject.owner, newProject.name, newProject.description, newProject.dateCreated, newProject.totalNeeded, newProject.totalCollated);            
    }
    
    function fundProject(uint256 id, string memory _contributorName) public payable{
        uint256 donation = msg.value;

        Project storage project = projects[id];
        

        project.contributors.push(msg.sender);

        giveramount[msg.sender] = donation;
        contributorNames[msg.sender] = _contributorName;


        project.contributions.push(donation);

        bool success = payable(project.owner).send(donation);
        if(success){
            project.totalCollated = project.totalCollated+donation;
            
        }
    }
    function getContributors(uint256 _val) view public returns(address[] memory, uint256[] memory){
        return(projects[_val].contributors, projects[_val].contributions);
        
        

        
    }
    function getAllProjects() public view returns(Project[] memory){
        Project[] memory allProjects = new Project[](totalProjects);

        for(uint i=0; i<totalProjects; i++){
            Project storage item = projects[i];
            allProjects[i] = item;
        }

        return allProjects;


    }
    
}
