function claim() public {
    uint myWai = 10000000000;
    uint totalWei = 20000000000;
    uint myPercentage = myWai/totalWei * 100;

    payable(msg.sender).transfer(12345/100*myPercentage);
}
