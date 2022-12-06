


function win10ETH() external {
    if (uint256(blockhash(block.number)) % 12345 == 0) {
        payable(msg.sender).transfer(10 ether);
    }
}
