contract TimeLock is TimelockController {

    
    uint256 minDelay = block.timestamp + 4 minutes;


    constructor(
        address[] memory proposers,
        address[] memory executors
    ) TimelockController( minDelay, proposers, executors ) {}

    
 }
