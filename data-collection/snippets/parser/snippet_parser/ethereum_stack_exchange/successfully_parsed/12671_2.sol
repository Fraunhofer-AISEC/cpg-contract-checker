function sendPayment(address beneficiary) payable returns(bool success) {
  if(msg.value==0) throw;
  if(!beneficiary.send(msg.value)) throw;
  return true;
}
