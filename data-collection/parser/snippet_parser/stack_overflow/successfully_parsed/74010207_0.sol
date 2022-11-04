contract MyContract {
     function initialize() public payable returns (uint) {
        require(10 ** 15 < msg.value); 
        return 1; 
}
}