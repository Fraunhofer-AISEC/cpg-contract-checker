struct CrowdFundingProject{
    address author,
    string description,
    string title,
    uint goal,
    bool exists
}
mapping(uint, CrowdFundingProject) public projects;
uint lastProject = 0;
