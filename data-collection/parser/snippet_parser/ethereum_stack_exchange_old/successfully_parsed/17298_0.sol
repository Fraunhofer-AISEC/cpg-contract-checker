pragma solidity ^0.4.8;

import "github.com/szerintedmi/solidity-itMapsLib/itMapsLib.sol";

contract GasTest  {
    using itMaps for itMaps.itMapUintUint;
    using itMaps for itMaps.itMapUintAddress;
    using itMaps for itMaps.itMapAddressUint;
    using itMaps for itMaps.itMapUintBool;
    using GasTestLib for GasTestLib.Game;

    GasTestLib.Game game;

    function addBet(uint number) returns (bool overwrittenBet) {
        if (game.winningAddress != address(0)) {
            
            game.winningAddress = address(0);
            game.smallestNumber = 0;
        }
        return game.im_bets.insert(msg.sender,number); 
    }

    function updateResults() returns (uint numberOfUnrevealedOrInvalidBets) {
        return game._updateResults();
    }

    function getResults() constant returns (address winningAddress, uint smallestNumber) {
        return (game.winningAddress, game.smallestNumber);
    }
}

library GasTestLib {

  

  using itMaps for itMaps.itMapAddressUint;
  using itMaps for itMaps.itMapUintAddress;
  using itMaps for itMaps.itMapUintBool;

  struct Game {

      
      itMaps.itMapAddressUint im_bets;
      
      uint smallestNumber;
      address winningAddress;
      ResultCalcHelper resultCalcHelper;
  }

  struct ResultCalcHelper {
    
    itMaps.itMapUintAddress im_seenOnce; 
    itMaps.itMapUintBool im_seenMultiple; 
                                          
                                          
  }

  function _updateResults(Game storage self) internal returns (uint numberOfUnrevealedOrInvalidBets) {
    
    
      ResultCalcHelper storage _resultCalcHelper = self.resultCalcHelper;
      uint numberOfBets = self.im_bets.size() ;
      uint numberToCheck;

      
      for(uint i = 0; i < numberOfBets  ; i++) {
          numberToCheck = self.im_bets.getValueByIndex(i); 
          if(numberToCheck > 0) { 
            if (_resultCalcHelper.im_seenMultiple.contains(numberToCheck) ) {
              continue;
            }
            if (_resultCalcHelper.im_seenOnce.contains(numberToCheck)) {
              _resultCalcHelper.im_seenOnce.remove(numberToCheck);
              _resultCalcHelper.im_seenMultiple.insert(numberToCheck, true);
            } else {
              
              _resultCalcHelper.im_seenOnce.insert( numberToCheck, self.im_bets.getKeyByIndex(i));
            }
          } else {
              numberOfUnrevealedOrInvalidBets++ ;
          } 
      } 

      
      self.winningAddress = address(0);
      self.smallestNumber = 0;
      uint seenOnceCount = _resultCalcHelper.im_seenOnce.size();
      for( i=0; i < seenOnceCount; i++) {
        numberToCheck = _resultCalcHelper.im_seenOnce.getKeyByIndex(i);
        if (numberToCheck < self.smallestNumber || self.smallestNumber == 0) {
          self.smallestNumber = numberToCheck;
          self.winningAddress = _resultCalcHelper.im_seenOnce.getValueByIndex(i);
        }
      }
      
      
      
      _resultCalcHelper.im_seenOnce.destroy();
      _resultCalcHelper.im_seenMultiple.destroy();
      self.im_bets.destroy();
      return numberOfUnrevealedOrInvalidBets;
  } 

}
