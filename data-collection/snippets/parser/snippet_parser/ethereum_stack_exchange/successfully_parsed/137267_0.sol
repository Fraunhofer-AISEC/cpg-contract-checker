
pragma solidity >=0.7.0 <0.9.0;
 
contract PiggyBank{
 
    uint private pot;
    
 
    constructor (uint contribution){
       
        pot = pot+contribution;
    }
 
    function peep () public view returns (uint) {
        return pot;
    }
 
    function addToPot(uint contribution) public {
       
        pot = pot + contribution;
    }
 
}
