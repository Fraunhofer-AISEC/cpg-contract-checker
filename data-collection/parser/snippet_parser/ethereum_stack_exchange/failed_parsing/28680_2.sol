function getCurrentEggs() constant returns (uint[]) {
 uint length =  listOfPlayers[msg.sender].listOfEggs.length;
 uint[] memory eggArray = new uint[](length);
            for(uint i = 0; i < length; i++){
               eggArray[i] =  listOfPlayers[msg.sender].listOfEggs[i];
            }
            return eggArray;
        }
 }
