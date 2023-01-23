contract FundMe {

    mapping (address => uint256) public addressToAmountFunded;




    address public owner;

    constructor() public {
        owner = msg.sender; 
    }

 

    function fund() public payable {
        uint256 minimumUSD = 50 * 10 ** 18;
        require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH!");
        addressToAmountFunded[msg.sender] += msg.value;
    }



    function withdraw() public payable {
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
    } 
}