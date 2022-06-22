function deliverPrizes(address payable winner) public onlyOwner{ 
    winner.transfer(address(this).balance);
}
