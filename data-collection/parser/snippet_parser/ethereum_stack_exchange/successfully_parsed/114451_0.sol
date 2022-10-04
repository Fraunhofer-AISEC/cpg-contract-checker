function sendETH(address payable to, uint256 amount)
public
nonReentrant {
    require(address(this).balance >= amount, "Insufficient funds");
    (bool sent, bytes memory data) = to.call{value: amount}("");
    require(sent, "Failed to send Ether");
}
