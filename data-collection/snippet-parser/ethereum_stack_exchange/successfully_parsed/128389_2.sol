function purchase() payable public {
  payable(receivingAddress).transfer(msg.value);
}
