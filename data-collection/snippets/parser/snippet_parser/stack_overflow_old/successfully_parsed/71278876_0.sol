struct voter{
    string name;
    address constituency;
    uint age;
    bool isVoted;
}

struct constituency{
    string name;
    voter[] candidates;
}

constituency[] public constituencyRegister;
function addConstituency(string memory _name,voter[] memory _candidates)
    public
{
    constituency memory c = constituency(_name, _candidates);
    constituencyRegister.push(c);
}
