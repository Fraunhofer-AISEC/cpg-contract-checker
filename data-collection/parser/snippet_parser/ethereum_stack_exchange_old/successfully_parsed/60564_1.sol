
pragma solidity ^0.8.0;

contract Arrays {

    uint256[4] stored = [uint256(4), 2, 5, 7];

    function areNumbersInStorage(uint256[] memory _input) public view returns(bool) {

        
        for (uint256 ii = 0; ii < _input.length; ii++) {
            
            for (uint256 jj = 0; jj < stored.length; jj++) {
                
                if (_input[ii] == stored[jj]) {
                    
                    break; 

                
                } else {
                    
                    
                    
                    if (jj == stored.length - 1) return false;

                    
                    continue;
                }
            }
        }
        
        
        
        
        return true;

    }

}

