    function setUint256(bytes32 slot, uint256 _value) private {
        
            assembly {
                sstore(slot, _value)
            }
        }

and getter as 

    function getUint256(bytes32 slot) private view returns (uint256 str) {
        
        assembly {
            str := sload(slot)
        }
    } 
