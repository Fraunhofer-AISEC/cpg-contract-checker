constructor(address payable wallet) public {
    require(!isContract(wallet));
    commissionWallet = wallet;
    startUNIX = block.timestamp.add(365 days);

}   
