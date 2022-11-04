function showInfo(uint _pesel) public view onlyMainPerson(msg.sender) returns (string memory, string memory) {
  string memory x = showName(_pesel);
  string memory y = showDate(_pesel);
  return(x,y);
}
