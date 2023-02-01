        uint skipPointer; 
        uint correctNum; 

        for (uint i = 30; i < 191; i += 32) {
            for (uint k = skipPointer; k < 6; k++) {
                if (keccak256(_slice(_ticket, i, 2)) == keccak256(winningSlices[k])) {
                    correctNum ++;
                    skipPointer = k + 1;
                    break;
                } else {
                    continue;
                }
            }
        }
        return correctNum;
