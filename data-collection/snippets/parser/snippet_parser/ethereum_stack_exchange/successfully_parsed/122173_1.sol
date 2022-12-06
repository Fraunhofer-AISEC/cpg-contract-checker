function winNft (uint winningNft ) internal  returns(bool){
    for(uint i=0; i < winningNft; i++){
        uint256 winningId =  block.timestamp % ((tokens.length-1) - min + 1) + min;
      _transferFrom(address(masterWallet),msg.sender,tokens[winningId]);

        tokens[winningId]=tokens[tokens.length-1];
        tokens.pop();
    }
   return true
    }
