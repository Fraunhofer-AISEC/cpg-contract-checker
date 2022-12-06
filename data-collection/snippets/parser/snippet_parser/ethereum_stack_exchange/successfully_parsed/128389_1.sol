function purchase() payable public {
  owner.transfer(msg.value);
}
