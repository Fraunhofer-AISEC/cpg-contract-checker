  

    pragma solidity 0.8.0;
    contract MyContract{
        uint start;
        uint end;
        modifier timeIsOver{
            require(block.timestamp<=end,"Time is up");
            _;
        }
         
        function startTimer() public{
            start=block.timestamp;
        }
        
        
        
        function endTimer(uint period) public {
            end=period+start;
        }

        function timeLeft() public view returns(uint){
            return end-block.timestamp;
        }

        function callThisWhenTimeIsUp() external timeIsOver{
            
        }

    }
