  
    
    uint8 result = uint8(uint256(keccak256(abi.encodePacked(block.difficulty, msg.sender, block.timestamp)))%2);
    bool won = false;
    if (guess == result) {
      won = true;
      uint256 win = (amount* 2/100*(100-houseedge));
       tokenpiggies.transfer(msg.sender, win-amount);
    }else{
        tokenpiggies.transferFrom(msg.sender, address(this), amount);  
    }

    emit GameResult(result);
    lastPlayedGames.push(Game(msg.sender, amount, guess,3, won, block.timestamp));
    return won; 
  }
