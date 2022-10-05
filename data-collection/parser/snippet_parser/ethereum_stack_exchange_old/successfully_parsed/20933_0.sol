contract ForceSend {
  function ForceSend(address recipient) payable {
    selfdestruct(recipient);
  }
}
