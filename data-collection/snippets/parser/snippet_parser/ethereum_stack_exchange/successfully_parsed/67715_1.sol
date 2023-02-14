modifier checkScheduled() {
    if(blockOrTimeReached()) {
        doScheduledTask()
    }
    _;

}

function simpleTask() public checkScheduled returns (uint256) {
    
}
