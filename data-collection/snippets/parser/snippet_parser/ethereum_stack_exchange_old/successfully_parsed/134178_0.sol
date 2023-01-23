
    
    
    pragma solidity ^0.8.8;
    
    import "./PriceConverter.sol";
    
    contract FundMe {
    
        using PriceConverter for uint256;
    
        uint256 minimumUSD = 50;
        mapping(address => uint256) public addressToAmountFunded;
        address[] public funders;
    
        address public owner;
    
        constructor(){
            owner = msg.sender;
        }
    
        function fund() public payable{
            require(msg.value.getConversionRate() >= minimumUSD, "amount not satisfied");
            funders.push(msg.sender);
            addressToAmountFunded[msg.sender] += msg.value;
        }
    
        function withdraw() public onlyOwner{
            
            for(uint256 funderIndex = 0; funderIndex <= funders.length; funderIndex ++){
                address funder = funders[funderIndex];
                addressToAmountFunded[funder] = 0;
            }
            
            funders = new address[](0);
            
            (bool sendSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
            require(sendSuccess,"send failed");
    
        }
    
        modifier onlyOwner{
            require(msg.sender == owner, "Sender is not owner");
            _;
        }
    }

