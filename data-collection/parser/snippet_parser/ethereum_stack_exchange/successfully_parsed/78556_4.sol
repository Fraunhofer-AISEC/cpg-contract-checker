pragma solidity 0.6.0;

contract Contract1 {

    mapping (address => uint256) votes;

    function voteCandidate(address _address) external {
        votes[_address]++;
    }

    function checkVotesCandidate(address _address) public view returns (uint) {
        return votes[_address];
    }
}

contract Caller1 {

    Contract1 c1;

    constructor(address _address) public {
        c1 = Contract1(_address);
    }

    function voteCandidate() public {
        c1.voteCandidate(msg.sender);
    }
}
