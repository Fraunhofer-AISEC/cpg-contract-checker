MyAsset memory newAsset = MyAsset({
  ....
  });
uint256 assetId = xxxx;
require(_to != address(0), "Invalid address for transferFrom");
_assignAssetTo(_to, _assetId); 
require(_checkAndCallSafeTransfer(_from, _to, _tokenId, _data));
