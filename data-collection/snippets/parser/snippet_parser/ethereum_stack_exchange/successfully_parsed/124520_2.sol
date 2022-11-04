function setStatusToInactive() external onlyOwner {
    myStatus = Status.INACTIVE;
}

function setStatusToFail() external onlyOwner {
    myStatus = Status.FAIL;
}

function setStatusToSuccess() external onlyOwner {
    myStatus = Status.SUCCESS;
}

function setStatusToPending() external onlyOwner {
    myStatus = Status.PENDING;
}
