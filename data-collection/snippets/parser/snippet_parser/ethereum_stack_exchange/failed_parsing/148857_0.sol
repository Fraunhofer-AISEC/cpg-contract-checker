   function initializeGenesisBlock(
    ExchangeData.State storage S,
    address _Addr,
    bytes32 _genesisMerkleRoot,
    bytes32 _genesisMerkleAssetRoot,
    bytes32 _domainSeparator
    )
    public
{
    require(address(0) != _Addr, "INVALID_ADDRESS");
    require(_genesisMerkleRoot != 0, "INVALID_GENESIS_MERKLE_ROOT");
    require(_genesisMerkleAssetRoot != 0, "INVALID_GENESIS_MERKLE_ASSET_ROOT");


  ................
  ...............
................
