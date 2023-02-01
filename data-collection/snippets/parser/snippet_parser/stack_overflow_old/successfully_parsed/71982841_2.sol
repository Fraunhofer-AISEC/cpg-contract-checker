function registerDao(
    address _daoAdress,
    string memory _daoTitle,
    string memory _http,
    uint _version
  ) public returns (bool) {
      
  moloch = Moloch(_daoAdress);
  (,,,bool exists,,) = moloch.members(msg.sender);

  require(exists == true, "must be a member");
  require(daos[_daoAdress] == false, "dao metadata already registered");

  daos[_daoAdress] = true;
  
  daoIdx = daoIdx + 1;
  emit Register(daoIdx, _daoAdress, _daoTitle, _http, _version);
  return true;
  
}
