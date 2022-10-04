 pragma solidity ^0.6.0;
    
    contract test {
        
        string public _feedback;
        
        function reply(string memory feedback) public
        {
           feedback = "Well done!";
        }
    }
