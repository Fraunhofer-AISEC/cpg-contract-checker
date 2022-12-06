function createProject(string title, string desc, uint goal) public{
    CrowdFundingProject newProject;
    newProject.author = msg.sender;
    newProject.title = title;
    newProject.description = desc;
    newProject.goal = goal;
    newProject.exists = true;
    lastProject += 1;
    projects[lastProject] = newProject;
}
