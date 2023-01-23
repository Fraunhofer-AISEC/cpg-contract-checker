
pragma solidity ^0.4.26;

contract Genetic{               
    uint public len;  
    uint[] public parent1;
    uint[] public parent2;

    function setValue() external{
        parent1=[1,1,0,1,0,0,0,1,1,0];
        parent2=[0,0,0,1,1,1,0,0,1,1];
        len = parent1.length;   
    }

    function getValue() public  view  returns (uint [] memory ,uint[] memory){
        return  (parent1 , parent2);
    }

    function singlPoint() public view  returns (uint[] memory){
        
        uint[] memory  child  = new uint [](len);

        uint[] memory father = parent1;
        uint[] memory mother = parent2;

        uint  cop = len / 2;
        for (uint i=0; i < cop; i++){
            child[i] = father[i];
        }
        for(uint j =cop; j < len; j++){  
            child[j] = mother[j];
        }   
                   
        return child; 
    }
}
