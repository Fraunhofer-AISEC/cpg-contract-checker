    uint public InitialBlockTime; 

    function CalculateYearsGoneBy() public {
        YearsGoneBy = ((block.timestamp - InitialBlockTime)/31556926);
    }
