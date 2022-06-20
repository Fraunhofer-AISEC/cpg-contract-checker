mapping(address => mapping(address => uint256)) public valueSpent;


    function test(uint256 initialPrice, address seller) public returns (bool){
        
        valueSpent[msg.sender][seller] = valueSpent[msg.sender][seller].add(initialPrice);
        valueSpent[seller][msg.sender] = valueSpent[msg.sender][seller];
        return true;
    }
    
    function getData() public {
    
    valueSpent[msg.sender][?????]


}
