 function randomArray(uint[] memory  population ) public view   returns(uint[] memory){
        uint  a = population.length; 
       uint   b = population.length; 
        for(uint i = 0; i< b ; i++){
            uint randNumber =(uint(keccak256      
            (abi.encodePacked(block.timestamp,population[i]))) % a)+1;
            uint interim = population[randNumber - 1];
            population[randNumber-1]= population[a-1];
            population[a-1] = interim;
            a = a-1;
        }
        
        result = population; 
             
        return result;  
        len = result.length;      
    
}