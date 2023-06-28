pragma solidity ^0.4.13;
    
    contract nietTeveel{
    
        uint public maxbedrag = 50;
        uint public restbedrag;
    
    
        function stortencheck () payable{
            if (msg.value >= maxbedrag){
                restbedrag = msg.value - maxbedrag;
                msg.sender.transfer(restbedrag);
            }else{
    
            }
        }
    
        function muurbloem () public {
            selfdestruct(msg.sender);
        }
    }
