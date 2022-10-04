contract {
...
  struct EtherBox {
    bytes32 label;
    address owner;
    string ownerUrl;
    uint256 expiration;
  }

  mapping (address => bytes32) public nicknames;
  mapping (address => address[]) public ownerToEtherBoxes;
  mapping (address => EtherBox) public etherBoxes;
  mapping (address => uint256) etherBoxesNonce;
...
  function publishEtherBox (bytes32 _label, string _ownerUrl, uint _lifespan) external onlyWhenRunning() payable {
      require(ownerToEtherBoxes[msg.sender].length < 10);
      assert(bytes(_ownerUrl).length <= 200);
      address etherBoxAddress = address(keccak256(msg.sender, etherBoxesNonce[msg.sender]++));
      ownerToEtherBoxes[msg.sender].push(etherBoxAddress);
      etherBoxes[etherBoxAddress] = EtherBox({
        label: _label,
        owner: msg.sender,
        ownerUrl: _ownerUrl,
        expiration: now + _lifespan
      });
      if(msg.value > 0){
        owner.transfer(msg.value);
      }
      emit EtherBoxPublished(msg.sender, nicknames[msg.sender], etherBoxAddress, _label, now);
  }
...
}
