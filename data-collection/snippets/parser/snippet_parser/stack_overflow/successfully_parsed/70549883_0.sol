address oldVoter;

  modifier checkSender(address actualVoter) {
        require(oldVoter != actualVoter);  
        _; 
    }


    function changeVote(address caller)public  {
        oldVoter =  caller;
    }


    function changeVote() public checkSender(msg.sender){
        olderVoter = caller;
    }
