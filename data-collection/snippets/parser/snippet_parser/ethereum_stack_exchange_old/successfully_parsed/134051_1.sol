
pragma solidity ^0.8.16;

contract Contract {

    uint[5][5] public arrayOfUintsArrays;

    
    uint256[8][5] public numbers;

    
    function fill() public {
        
        numbers[0][0] = 5;
        numbers[1][0] = 5;
        numbers[2][0] = 5;
        numbers[3][0] = 5;
        numbers[4][0] = 5;
        
        
        
    }

    
    function fillArray() public {

        
        uint[5][5] memory arrayOfUintsArraysCopy = arrayOfUintsArrays;

        for(uint i = 0; i < 5; i++) {
            for(uint j = 0; j < 5; j++) {
                
                
                arrayOfUintsArraysCopy[j][i] = j + i;
            }
        }

        
        arrayOfUintsArrays = arrayOfUintsArraysCopy;

    }

    function getArrays() public view returns(uint[5][5] memory) {
        return arrayOfUintsArrays;
    }

    function getNumbers() public view returns(uint[8][5] memory) {
        return numbers;
    }

}

