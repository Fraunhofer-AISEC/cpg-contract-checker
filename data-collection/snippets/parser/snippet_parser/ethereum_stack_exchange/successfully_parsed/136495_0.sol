contract FundMe {
    using PriceConverter for uint256;

    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    
    address public  owner;
    uint256 public constant MINIMUM_USD = 50 * 10 ** 18;
    
    
       
   
constructor() {
    owner = msg.sender;
}
    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "You need to spend more ETH!");
        
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }
    
    function Withdraw() public OnlyOwner {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex = funderIndex ++){
       address funder = funders[funderIndex];
       addressToAmountFunded[funder] = 0;

        }
        
        funders = new address[] (0);

        
        
        
        
        (bool callSuccess, ) = payable (msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");

       
    }
 modifier OnlyOwner {
            require(msg.sender == owner, "Sender is not Owner!");
            _;
        }
}
