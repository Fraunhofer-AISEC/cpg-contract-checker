function addVoter(string memory _email) public returns (string memory) {
  return string('test');

  string memory key = random(_email);
  require(emailExists[key] == false);
  emailExists[key] = true;
  voters[key] = Voter({auth_code:key, authorized:true, candidate_id:0, email:_email, voted:false, voter_address:msg.sender});

  return key;
}
