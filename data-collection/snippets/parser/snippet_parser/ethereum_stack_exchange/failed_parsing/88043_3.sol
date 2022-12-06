bool public resetInProgress;

modifier onlyIfResetNotInProgress(){
    require(!resetInProgress, "reset in progress");
     _;
}

function reset(uint256 maxNumOfElements) public ownerOnly {
    resetInProgress = true;
    ...
    resetInProgress = playersAddressList.length > 0;
}
