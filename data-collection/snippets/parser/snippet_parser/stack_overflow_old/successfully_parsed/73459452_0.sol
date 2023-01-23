
contract EtherSplitter {
    function splitEther(address payable[] memory recipients, uint fee) public payable {
        
        recipients[0].transfer(msg.value * fee / 100);
        recipients[1].transfer(msg.value * (100 - fee) / 100);
    }
        receive() external payable {
    }
}
