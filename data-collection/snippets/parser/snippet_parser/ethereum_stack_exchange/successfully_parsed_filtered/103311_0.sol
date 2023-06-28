
pragma solidity >=0.7.0 <0.9.0;

contract MultisigWallet {

  mapping(address => address) internal owners;

  uint256 internal ownerCount;
  uint256 internal threshold;
  address internal constant SENTINEL_OWNERS = address(0x1);

  function setupOwners(address[] memory _owners, uint256 _threshold) internal {
    require(threshold == 0);
    require(_threshold <= _owners.length);
    require(_threshold >= 1);
    address currentOwner = SENTINEL_OWNERS;
    for(uint256 i = 0; i < _owners.length; i++) {
      address owner = _owners[i];
      require(owner != address(0) && owner != SENTINEL_OWNERS && owner != address(this) && currentOwner != owner);
      require(owners[owner] != address(0));
      owners[currentOwner] = owner;
      currentOwner = owner;
    }
    owners[currentOwner] = SENTINEL_OWNERS;
    ownerCount = _owners.length;
    threshold = _threshold;
  }

}
