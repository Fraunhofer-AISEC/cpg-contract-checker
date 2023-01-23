contract FundMe {
    
    mapping(address =>uint256) public addressToAmountFunded;
    
    address payable[] public funders;
    
    address payable public owner;
    
    constructor() public {
        owner = msg.sender; 
    }
    
    function fund() public payable {
        uint256 minimumUSD = 50 * 10 ** 18; 
        
        require(getConversionRate(msg.value) >= minimumUSD, "you need to spend more ETH my friend");
        
        addressToAmountFunded[msg.sender] += msg.value;
        
        funders.push(msg.sender); 
        
    }
}