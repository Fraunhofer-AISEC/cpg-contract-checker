 constructor(string memory enterOrganizationName) public {
    owner = msg.sender;
    status = true;
    addUser(0, "", "");
    addUser(owner, 'Creator and Owner of Smart Contract', "");
    organizationName = enterOrganizationName;
    numberOfUsers = 0;
    addEndorsee(0, "");
    numberOfEndorsees = 0;
}
