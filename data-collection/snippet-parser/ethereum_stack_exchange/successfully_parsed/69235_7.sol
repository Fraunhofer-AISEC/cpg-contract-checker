constructor(Passport _pass, string memory _electionName) public
{
    pass = _pass;
    owner = msg.sender;
    electionName = _electionName;
}
