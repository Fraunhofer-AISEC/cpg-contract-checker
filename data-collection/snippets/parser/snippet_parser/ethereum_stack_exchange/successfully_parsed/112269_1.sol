function depositEther(uint256 _amount) external payable {
     require(msg.value == 0.1 ether);  
     players.push(payable(msg.sender));

}
receive() external payable {
    
}
