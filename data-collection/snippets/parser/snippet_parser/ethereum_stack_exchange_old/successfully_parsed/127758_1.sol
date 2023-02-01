function claim() public {
    
    Lock storage lock = tokenLock[msg.sender];

    
    require(lock.endtime >= block.timestamp);

    
    IERC20(lock.token).transfer(msg.sender, lock.amount);
}
