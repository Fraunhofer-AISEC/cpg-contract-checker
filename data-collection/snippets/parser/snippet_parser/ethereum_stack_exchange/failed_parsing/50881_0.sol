mapping(address => UnpaidAction[]) unpaidActions;

function claimPayment() public returns (bool){
        uint arrayLength = unpaidActions[msg.sender].length;
        if (arrayLength != 0) {

            UnpaidAction[] memory stillUnpaid;
            uint offset = 0;
            for (uint i = 0; i < arrayLength; i++) {

                if () {
                    ...
                } else {
                    
                    stillUnpaid[offset] = unpaidActions[msg.sender][i];
                    offset += 1;
                }
            }

            
            unpaidActions[msg.sender] = stillUnpaid
        }

        return true;
    }
