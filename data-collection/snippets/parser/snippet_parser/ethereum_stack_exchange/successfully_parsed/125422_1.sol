function claim() public {
    uint myWai =    10000000000;
    uint totalWei = 20000000000;
    uint myPercentage = myWai * 1e18 / totalWei; 

    payable(msg.sender).transfer(12345 * myPercentage / 1e18); 
}

