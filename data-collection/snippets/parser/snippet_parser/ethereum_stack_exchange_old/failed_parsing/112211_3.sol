function deposit() payable {
  deposits[msg.sender] += msg.value;
};
