contract B is ERC721 {
  uint nextDogID = 0;
  IERC721 a = ...;

  function catToDog (uint _catID) public (returns _dogID) {
    _dogID = nextDogID++;
    _mint (msg.sender, _dogID);
    copyGene (_catID, _dogID);

    
    require (a.transferFrom (
      msg.sender,
      0x000000000000000000000000000000000000dead,
      _catID));
  }
}
