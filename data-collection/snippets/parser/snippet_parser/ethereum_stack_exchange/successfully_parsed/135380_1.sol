struct OptionPos {
    uint pos;
    bool exists;
}




uint[] public votes;
string[] public options;
mapping(address=>bool) hasVoted;
mapping(string=>OptionPos) posOfOption;
bool votingStarted;

function addOption(string memory option) public {
    require(!votingStarted);
    options.push(option);
}

function startVoting() public{
    require(!votingStarted);
    
    
    for (uint cnt = 0; cnt < options.length; cnt++) {
        OptionPos memory option = OptionPos(cnt, true);
        posOfOption[options[cnt]] = option;
    }
    votingStarted = true;
}

function vote(uint option) public {
    require(option >= 0 && option < options.length);
    require(!(hasVoted[msg.sender]));
    votes[option] += 1;
    hasVoted[msg.sender] = true;
}

function vote(string memory optionName) public {
    require(!(hasVoted[msg.sender]));
    
    OptionPos memory optionPos = posOfOption[optionName];
    require(optionPos.exists);
    
    votes[optionPos.pos] += 1;
    hasVoted[msg.sender] = true;
}

function getVotes() public view returns (uint[] memory) {
    return votes;
}
