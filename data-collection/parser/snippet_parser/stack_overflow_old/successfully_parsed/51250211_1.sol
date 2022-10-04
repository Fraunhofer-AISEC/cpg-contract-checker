address[] public deployedProjects;
mapping(address => string) public projectTitle;

function createProject(string startup, string title, string deadline, string description, uint wage) public {
    address newProject = new Project(startup, title, deadline, description, wage, msg.sender);
    projectTitle[newProject] = title;
    deployedProjects.push(newProject);
}

function getDeployedProjects() public view returns (address[]) {
    return (
        deployedProjects
    );
}
