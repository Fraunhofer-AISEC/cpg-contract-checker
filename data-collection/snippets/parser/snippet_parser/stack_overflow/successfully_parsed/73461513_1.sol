contract EtherSplitter {
    function splitEther(address payable[] memory recipients) public payable {
        uint fee = 10;
        
        recipients[0].transfer(msg.value * fee / 100);
        recipients[1].transfer(msg.value * (100 - fee) / 100);
    }
        receive() external payable {
    }
}
