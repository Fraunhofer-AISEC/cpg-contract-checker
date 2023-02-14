contract MockCall {
    struct VoteResults {
        uint256 votes;
        bytes data;
    }

    event LogParam(uint256 param);
    event LogParam(string name);
    event LogParam(VoteResults[] results);

    bool public isAction1 = false;
    bool public isAction2 = false;

    
    function Action(uint256 param1, string calldata name) public {
        isAction1 = true;
    }

    
    function Action(uint256 param1, string calldata name, VoteResults[] calldata voteResults) public {
        isAction2 = true;
        emit LogParam(param1);
        emit LogParam(name);
        emit LogParam(voteResults);
    }
}
