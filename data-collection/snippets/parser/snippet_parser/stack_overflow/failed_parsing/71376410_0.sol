function readAllTask() public view returns (uint, uint256, uint256) {
        return (tasks.id, tasks.stackAddress, tasks.nftId);  <============= return everything
    }
