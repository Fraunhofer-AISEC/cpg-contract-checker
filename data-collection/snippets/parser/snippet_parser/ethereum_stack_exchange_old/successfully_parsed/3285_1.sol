contract Answer {
  mapping(address => mapping(string => bool)) voters;

  struct qList {
    uint count; 
    mapping(address => mapping(uint => uint)) answer;
  }

  mapping(string => qList) questionnaires;

  function vote(string ID, uint qNum, uint ans) returns (bool) {
    if (voters[msg.sender][ID]) throw;
    voters[msg.sender][ID] = true;
    questionnaires[ID].count += 1;
    questionnaires[ID].answer[msg.sender][qNum] = ans;
    return true;
  }

  function getNumResult(string ID) constant returns (uint res) {
    return questionnaires[ID].count;
  }
}
