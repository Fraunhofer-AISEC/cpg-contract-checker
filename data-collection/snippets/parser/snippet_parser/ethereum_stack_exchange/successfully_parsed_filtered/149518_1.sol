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
