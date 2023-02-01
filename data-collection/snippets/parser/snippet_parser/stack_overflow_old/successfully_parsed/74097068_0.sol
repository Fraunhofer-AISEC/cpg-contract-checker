

pragma solidity 0.5.0;
contract SimpleDemoGA{ 
    Population  population  = new Population();
        uint generationCount  ;
        Individual fittest ;
        Individual secondFittest ;   
    function Random(uint number) public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,  
        msg.sender))) % number;
    }
        
    
    function main() public {
       uint rn;
       uint random = Random(rn); 
      
      SimpleDemoGA   demo = new SimpleDemoGA();
       
         
         demo.population.initializePopulation(10);
         
         demo.population.calculateFitness();
        
         
       while (demo.population.fittest < 5){
            demo.generationCount++;
        
        demo.selection();
        
        demo.crossover();
        
        if (random % 7 < 5){
            demo.mutation();
        }
        
        demo.addFittestOffspring();
        
        demo.population.calculateFitness();
       
         }
       
    }
     
     function selection () public  {
          
         
         fittest =Population.getFittest();
         
         secondFittest = Population.getSecondFittest();
     }
     
     function crossover() public {
       uint rn;
       uint random = Random(rn); 
         
         uint crossOverPoint = random.population.individuals[0].geneLength;
         
         for (uint i=0 ;i<crossOverPoint;i++){
             uint temp = fittest.genes[i];
             fittest.genes[i] = secondFittest.genes[i];
             secondFittest.genes[i] = temp;
         }
     }
     function mutation() public {
       uint rn;
       uint random = Random(rn);
       
       uint mutationPoint = random.population.individuals[0].geneLength;
         
       if(fittest.genes[mutationPoint]== 0){
         fittest.genes[mutationPoint]==1;
        }
     else {
         fittest.genes[mutationPoint] = 0;
     }
     mutationPoint = random.population.individuals[0].geneLength;
     if(secondFittest.genes[mutationPoint]== 0){
         secondFittest.genes[mutationPoint] = 1;
     }
     else {
         secondFittest.genes[mutationPoint]=0;
     }
 } 
 
 function getFittestOffspring()public {
     if(fittest.fitness > secondFittest.fitness){
         return fittest;
     }
     return secondFittest;
 }   
 
 function addFittestOffspring()public {
     
     fittest.calcFitness();
     secondFittest.calcFitness();
     
     uint leastFittestIndex = Population.getLeastFittestIndex();
     
     Population.individuals[leastFittestIndex] = getFittestOffspring();
 }
}


contract Individual{
    uint fitness = 0;
    uint [] genes = new uint  [](5);
    uint geneLength = 5;
    uint rn;

    function individual( ) public {
    uint random = Random(rn);
    
    for (uint i = 0 ; i<genes.length;i++){
        genes[i]= random % 2 ;
    }
    fitness = 0 ;
    }
     function Random(uint number) public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,  
        msg.sender))) % number;
    }
 

    function calcFitness()public view returns (uint)  {
    fitness =0;
    for(uint i = 0; i < 5 ; i++){
        if(genes[i] == 1){
            fitness++;
        }
    }
    return fitness;
}
}


contract Population{
    uint popSize = 10;
    Individual[] individuals = new Individual[](10);
    uint fittest =0;
    uint256  public  maxFit;
    
    function initializePopulation( uint size )public returns (Individual[] memory ){
        for(uint i = 0; i< individuals.length;i++){
            individuals[i] = new Individual();
        }
    }

    
    function getFittest() external   {
         maxFit = uint256 ( maxFit).min;
        uint maxFitIndex = 0;
        for(uint i = 0; i<individuals.length;i++){
            if(maxFit <= individuals[i].fitness){
                maxFit = individuals[i].fitness;
                maxFitIndex = i;
            }
        }
        fittest =individuals[maxFitIndex].fitness;
        return individuals[maxFitIndex];
    }
    
    function getSecondFittest() public returns (Individual[] memory) {
        uint maxFit1 = 0;
        uint maxFit2 =0;
        for(uint i =0; i< individuals.length;i++){
            if(individuals[i].fitness > individuals[maxFit1].fitness){
                maxFit2 = maxFit1;
                maxFit1 = i;
            }
            else {
                if (individuals[i].fitness > individuals[maxFit2].fitness){
                    maxFit2 = i;
                }
            }
            return individuals[maxFit2];
        }
    }
        
        function  getLeastFittestIndex() public {
            uint minFitVal = uint().Max;
            uint minFitIndex = 0;
            for(uint i = 0 ; i < individuals.length;i++){
                if(minFitVal >= individuals[i].fitness){
                    minFitVal = individuals[i].fitness;
                    minFitIndex =i;
                }
            }
            return minFitIndex;
        }
        
        function  calculateFitness()public {
            for(uint i =0; i< individuals.length;i++){
                individuals[i].calcFitness();
            }
           this. getFittest();
        }
}

    
