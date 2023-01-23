function isOwner(address _addr) constant returns (bool) {
   return _walletLibrary.delegatecall(msg.data);
}
