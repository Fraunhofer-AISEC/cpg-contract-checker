uint ownerCounter = 0;

function getNumberOfTokenOwners() public view onlyOwner returns ( uint ) {
    return ownerCounter;
}
