function transferEther(address receiver) external payable {
    payable(receiver).call{value: msg.value}("");
}
