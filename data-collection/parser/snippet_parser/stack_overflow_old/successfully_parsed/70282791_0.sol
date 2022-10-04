  
  
  

  function generateRandomTicketNumbers(uint256 _lotteryCount) internal view returns (uint8[5] memory) {
    uint8[5] memory numbers;
    uint256 generatedNumber;

    
    for (uint256 i = 0; i < 5; i++) {
      
      bool readyToAdd = false;
      uint256 maxRetry = 5;
      uint256 retry = 0;

      
      while (!readyToAdd && retry <= maxRetry) {
        generatedNumber = (uint256(keccak256(abi.encodePacked(msg.sender, block.timestamp, i, retry, _lotteryCount))) % 25).add(1);
        bool isDuplicate = false;

        
        for (uint256 j = 0; j < numbers.length; j++) {
          if (numbers[j] == generatedNumber) {
            isDuplicate = true;
            break;
          }
        }
        readyToAdd = !isDuplicate;
        retry++;
      }
      
      require(retry < maxRetry, 'Error generating random ticket numbers. Max retry.');
      numbers[i] = uint8(generatedNumber);
    }

    return numbers;
  }
