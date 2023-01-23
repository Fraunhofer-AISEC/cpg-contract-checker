pragma solidity >=0.8.0;


import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract myContract {
    address payable[] recipients;
    mapping(address => uint256) public balanceAccount;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function send_ETH(address payable recipient, uint256 amount) public {
        
        uint256 minimumUSD = 0.01 * 10 ** 18;
        amount = minimumUSD;
        require(getConversionRate(amount) >= minimumUSD, "You need to spend more ETH!");
        
        this.invest(amount);
        this.fund(recipient);
    }

    function invest(uint256 amount) payable external{
        

        recordTransaction(address(this), amount, false);
        recordTransaction(owner, amount, true);
        address payable contractAddress = payable(address(this));
        contractAddress.send(amount);
    }

    function fund(address payable recipient) external {
        

        recordTransaction(address(this), address(this).balance, true);
        recordTransaction(recipient, address(this).balance, false);
        recipient.send(address(this).balance);
    }

    function recordTransaction(address recipient, uint256 deposit, bool out) private {
        if (out) {
            balanceAccount[recipient] -= deposit;
        } else {
            balanceAccount[recipient] += deposit;
        }
    }


    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 answer,,,) = priceFeed.latestRoundData();
         
         return uint256(answer * 10000000000);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        
        return ethAmountInUsd;
    }
}
