  ```
    `````
   

pragma solidity ^0.4.6;

contract Genetic{

    

    uint64 ERR_NOT_A_PAIR = 12;
     
    uint256 mutateProbablity = 100;

    
     uint256 mutateDoubleProbablity = 10;
       uint[2][] population ;
      
    
     uint public constant MaxNumber = 100;
    

    function randomnumber() public   returns (uint){
        uint random = uint(keccak256(abi.encodePacked(block.timestamp))) % 2;
        for(uint i = MaxNumber; i > population.length ; i++){  
            population.push([random,random]);  
            return  random;

        }
    }

    function getPopulation() public view returns(uint[2][]){
        return  population;
    }

    function  getIndividual() public  returns(uint[])  { 
         uint[2][] memory  pop = new uint[2][](10);
         uint[]  memory  indiv1 = new uint [](5);
           pop = getPopulation();
          
        for (uint i = 0 ; i< 5;i++){
            uint x = uint(keccak256(abi.encodePacked(block.timestamp))) % 2;
            uint y = uint(keccak256(abi.encodePacked(block.timestamp))) % 5;
                indiv1[i] = pop[x][y];
        }    
        return indiv1;

    }
}