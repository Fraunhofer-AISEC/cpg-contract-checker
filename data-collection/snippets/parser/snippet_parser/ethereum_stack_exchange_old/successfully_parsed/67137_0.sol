    pragma solidity 0.4.25;
    
    contract Risky {
        
        string public vital;
        
        constructor() public {
            vital = "do not change";
        }
    }
    
    contract Careless is Risky {
        
        function oops() public {
            
            
            
            vital = "game over";
        }
    }
    
    
    
    contract Cautious {
        
        string private vital;
        
        constructor() public {
            vital = "cannot be changed by accident";
        }
        
        function getVital() public view returns(string) {
            return vital;
        }
        
        function setVital(string youKnowWhatYoureDoing) public {
            vital = youKnowWhatYoureDoing;
        }
    }
    
    contract Isolated is Cautious {
        
        
        
    }
