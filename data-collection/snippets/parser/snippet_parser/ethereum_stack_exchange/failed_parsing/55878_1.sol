Contract A is B {

  Contract A { 
   struct GameInstance {
     
   }

  mapping(bytes32 => uint256) idToIndex;
  GameInstance[] activeGames;

  function ex(bytes32 instanceId) {
    uint256 index = idToIndex[instanceId];
    activeGames[index].example = super.ex(activeGames[index]) ;
  }   
}
