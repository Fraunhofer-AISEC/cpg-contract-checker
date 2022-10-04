uint[] assets;
mapping(uint=>uint) indexOfAsset;

function removeAssetFromArray(uint _assetToDelete) {
  uint index = indexOfAsset[_assetToDelete];
  if (!index) return;

  if (assets.length > 1) {
    assets[index] = assets[assets.length-1];
  }
  assets.length--; 
}
