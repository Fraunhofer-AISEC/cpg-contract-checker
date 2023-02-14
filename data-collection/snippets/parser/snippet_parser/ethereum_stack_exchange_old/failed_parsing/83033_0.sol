contract WalletLibrary {
   function initWallet(address[] _owners, uint _required, uint _daylimit) {
     pass
  }
}

contract Wallet {
   
  function() payable {
    if (msg.data.length > 0) {
      _walletLibrary.delegatecall(msg.data);
    }
  }
  ...
}
