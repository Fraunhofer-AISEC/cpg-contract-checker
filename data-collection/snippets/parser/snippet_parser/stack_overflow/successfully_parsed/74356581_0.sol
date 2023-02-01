    
    
    pragma solidity ^0.4.26;
    
    contract Genetic{
   uint[5][10]    population ;
    function expand(uint256 randomValue) public view  returns (uint256[] memory expandedValues) {
         expandedValues = new uint256[](50);
        for (uint256 i = 0; i < 50; i++) {
            expandedValues[i] = uint256(keccak256(abi.encode(randomValue, i)))%2;
        }
         
        
        return expandedValues;
        }
        function getPopulation () public view returns( uint [5][10] ){
            
            
            uint[]  memory chromosom = new uint[](50);
            uint r;
            chromosom =expand(r);
            for(uint i =0; i < 10; i++){
             for(uint j =0 ;j< 5; j++){
                 population [i][j] =  chromosom[(i*5) + j];
             }
         }
         return population;
        }
    }
