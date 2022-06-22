struct Project {
  string name;
  address[] whitelist;
}

mapping(uint => Project) public projects;

function setProject(Project calldata project) external {
  projects[1] = project;
}
