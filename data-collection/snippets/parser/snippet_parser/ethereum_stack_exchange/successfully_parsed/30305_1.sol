mapping(address => uint) balances;
address[] participants;

function deposit() payable {
  if (balances[msg.sender] == 0) {
    participants.push(msg.sender);
  }
  balances[msg.sender] += msg.value;
}
