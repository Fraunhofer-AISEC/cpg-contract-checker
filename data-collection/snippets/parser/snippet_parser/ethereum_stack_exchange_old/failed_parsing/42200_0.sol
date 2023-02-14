contract B is ERC721 {
  uint nextDogID = 0;
  A a = ...;

  function catToDog (uint _catID) public (returns _dogID) {
    _dogID = nextDogID++;
    _mint (msg.sender, _dogID);
    copyGene (_catID, _dogID);
    require (a.transferFrom (msg.sender, address (this), _catID));
    require (a.burn (_catID)); 
  }
}
