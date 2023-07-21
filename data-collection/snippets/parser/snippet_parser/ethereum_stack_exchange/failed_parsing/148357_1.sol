function _getSkin (uint256 skinId) private view returns (Skin memory) {
  Skin memory skin = skins[skinId];
  require(skin.author != address(0), "Skin not registered yet.");
  return skin;
}
function doStuff (uint256 skinId) public {
  Skin memory skin = _getSkin(skinId);
  skin...........
}
