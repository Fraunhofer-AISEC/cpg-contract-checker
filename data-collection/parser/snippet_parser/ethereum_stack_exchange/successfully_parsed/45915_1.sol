mapping(address => Project) projects;
address[] projectAddresses;

function createProject(string name, uint amount) public {
    StandardToken token = new ProjectToken(name, amount);
    projectAddresses.push(token);
    projects[token] = Project(name, amount, amount, token, true);
}
