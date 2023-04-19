
pragma solidity 0.8.8;

contract Variables {

    uint256 public minimum = 1e18; 
    event AccountFunded(uint256 minimum);
    address[] public investors;
    mapping(address => uint256) public addressToInvestment;
    address owner;
    address[] public funders;
    mapping(address => uint256) public addressToFunding;

    constructor() {
        owner = msg.sender; 
    }

    function isOwner() private view returns (bool) {
        return msg.sender == owner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier notOwner() {
        require(msg.sender != owner);
        _;
    }

    modifier checkSender () {
        assert(msg.sender == msg.sender);
        _;
    }

    function fundMoneyBasket () public payable notOwner checkSender {
        funders.push(msg.sender);
        addressToFunding[msg.sender] = msg.value;
    }

    function withdrawMoneybasket () public payable notOwner {
        uint256 withdrawAmount = msg.value;
        (bool success, ) = msg.sender.call{value: withdrawAmount}("");
        require(success, "return transaction failed");
    }

    function fundContract () public payable {
        require(msg.value >= minimum, "NOT ENOUGH ETH, SEND MORE");
        emit AccountFunded(minimum); 
        investors.push(msg.sender);
        addressToInvestment[msg.sender] = msg.value;
        
    }

    function withdraw () public onlyOwner {
        
        payable(msg.sender).transfer(address(this).balance);
        for(uint256 funderIndex = 0; funderIndex < investors.length; funderIndex++ ){
        address funder = investors[funderIndex];
        addressToInvestment[funder] = 0;
        }       
        investors = new address[](0);
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}(""); 
        require(callSuccess, "Call f4iled"); 
    }


}
