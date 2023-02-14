function addProject(
bytes32[] pictures,
string a,
string b,
string c,
string d,
string e,
string f,
string g,
string h) external payable returns(bytes32) {
  if(msg.sender != owner()) {
    require(msg.value < price, "received insufficient value");

    owner().transfer(msg.value);
  }

  return registery.addProject(
    msg.sender,
    pictures,
    a,b,c,d,e,f,g,h
    );
}
