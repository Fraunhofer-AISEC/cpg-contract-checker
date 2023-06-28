for(uint i = 0; i < sizeOfLottery_; i++){
            
            bytes32 hashOfRandom = keccak256(abi.encodePacked(_randomNumber, i));
            
            uint256 numberRepresentation = uint256(hashOfRandom);
            
            winningNumbers[i] = uint16(numberRepresentation.mod(maxValidRange_));
        }
