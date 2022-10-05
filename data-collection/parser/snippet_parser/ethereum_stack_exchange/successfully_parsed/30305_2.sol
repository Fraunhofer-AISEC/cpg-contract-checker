mapping(address => uint) balances;
address[] participants;
mapping(address => uint) indices;

function transfer(address recipient, uint amount) {
  if (balances[recipient] == 0) {
    participants.push(recipient);
    indices[recipient] = participants.length - 1;
  }
  
  if (balances[msg.sender] == 0) {
    delete participants[indices[msg.sender]];
  }
}
