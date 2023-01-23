function claimPayment() public returns (bool){
        uint arrayLength = unpaidActions[msg.sender].length;
        if (arrayLength != 0) {

            for (uint i = 0; i < arrayLength; i++) {

                if () {

                    balances[msg.sender] += 100 

                    
                    delete unpaidActions[msg.sender][i]

                } 
            }

            

            uint offset = 0;
            for (uint i = 0; i < arrayLength; i++) {
                if (offset > 0) {
                    unpaidActions[msg.sender][i - offset] = unpaidActions[msg.sender][i]
                }

                
                if (unpaidActions[msg.sender][i].someIntVar == 0) {
                    offset +=1;
                } 
            }
            unpaidActions[msg.sender][i].length -= offset
        }

        return true;
    }
