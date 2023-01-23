
pragma solidity 0.8.16;



uint256 constant MAX_SUPPLY = 30 * 10 ** 18;

contract Contract {

    
    uint256 public constant FEE ; 

     
    uint256 public constant MIN_VALUE = 5;

    
    
    address public immutable owner;

    constructor() {
        owner = msg.sender; 

        
        
        FEE = 1; 
    }

    function getValue(uint256 v) public {

        
        if(MIN_VALUE > v) {
            
        }

        
        require(msg.sender == owner, "Not owner");


        
        uint256 value = FEE * MAX_SUPPLY * v;

    }

}

