struct Candidate {
    uint64 votes;
    string name;
    mapping(address => uint) voteMapping;
    bool flag;
    address add;
  }
  struct Team {
    Candidate[] candidates;
    mapping(uint => Candidate) candidateMapping;
    mapping(address => bool) addressMap;
    string name;
    uint[] cidArr;
    uint token;
    address creator;
    bool flag;
  }

function vote(uint tCid, uint cid) external {
    Team storage t = getTeam(tCid);
    if (t.flag) {
      Candidate storage c = t.candidateMapping[cid];
      if (
        c.flag && c.voteMapping[msg.sender] == 0 && t.addressMap[msg.sender]
      ) {
        c.voteMapping[msg.sender] = 1;
        c.votes++;
        emit VoteDone(true);
      }
    }
    emit VoteDone(false);
  }
  function getCandidateVotes(
    uint tCid,
    uint cid
  ) external view returns (uint256) {
    Team storage t = getTeam(tCid);
    Candidate storage c = t.candidateMapping[cid];
    return c.votes;
  }
