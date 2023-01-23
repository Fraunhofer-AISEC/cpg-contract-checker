function forwardFunds(address recipient) payable returns(bool success) {
  LogForwarded(msg.sender, msg.value, recipient);
  if(!recipient.send(msg.value)) throw;
  return true; 
}
