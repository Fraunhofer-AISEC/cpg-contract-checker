pragma solidity 0.4.24;
pragma experimental ABIEncoderV2;




import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.4/Aggregator.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.4/vendor/Ownable.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.4/interfaces/LinkTokenInterface.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.4/interfaces/AggregatorInterface.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.4/vendor/SafeMathChainlink.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.4/interfaces/AggregatorV3Interface.sol";






contract InsuranceProvider {

    using SafeMathChainlink for uint; 
    address public insurer = msg.sender; 
    AggregatorV3Interface internal priceFeed; 

    uint public constant DAY_IN_SECONDS = 60; 

    uint256 constant private ORACLE_PAYMENT = 0.1 * 10**18; 
    address public constant LINK_KOVAN = 0xa36085F69e2889c224210F603D836748e7dC0088 ; 

 
    
    mapping (address => InsuranceContract) contracts;


    constructor()   public payable {
        priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331); 
    }

    

    modifier onlyOwner() {
        require(insurer == msg.sender, 'Only Insurance provider can do this');
        _;
    }
     

   
    event contractCreated(address _insuranceContract, uint _premium, uint _totalCover);


    
    function newContract(address _client, uint _duration, uint _premium, uint _payoutValue, string _cropLocation) public payable onlyOwner() returns(address) {
       
        
        
        InsuranceContract i = (new InsuranceContract).value((_payoutValue * 1 ether).div(uint(getLatestPrice())))(_client, _duration, _premium, _payoutValue, _cropLocation, LINK_KOVAN, ORACLE_PAYMENT);
        contracts[address(i)] = i;  

        
        emit contractCreated(address(i), msg.value, _payoutValue);

        
        LinkTokenInterface link = LinkTokenInterface(i.getChainlinkToken());
        link.transfer(address(i), ((_duration.div(DAY_IN_SECONDS)) + 2) * ORACLE_PAYMENT.mul(2));


        return address(i);

    }


    
    function getContract(address _contract) external view returns (InsuranceContract) {
        return contracts[_contract];
    }

    
    function updateContract(address _contract) external {
        InsuranceContract i = InsuranceContract(_contract);
        i.updateContract();
    }

    
    function getContractRainfall(address _contract) external view returns(uint) {
        InsuranceContract i = InsuranceContract(_contract);
        return i.getCurrentRainfall();
    }

    
    function getContractRequestCount(address _contract) external view returns(uint) {
        InsuranceContract i = InsuranceContract(_contract);
        return i.getRequestCount();
    }



    
    function getInsurer() external view returns (address) {
        return insurer;
    }



    
    function getContractStatus(address _address) external view returns (bool) {
        InsuranceContract i = InsuranceContract(_address);
        return i.getContractStatus();
    }

    
    function getContractBalance() external view returns (uint) {
        return address(this).balance;
    }

    
    function endContractProvider() external payable onlyOwner() {
        LinkTokenInterface link = LinkTokenInterface(LINK_KOVAN);
        require(link.transfer(msg.sender, link.balanceOf(address(this))), "Unable to transfer");
        selfdestruct(insurer);
    }



    
    function getLatestPrice() public view returns (int) {
        (   uint80 roundID,
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        
        require(timeStamp > 0, "Round not complete");
        return price;
    }

    
    function() external payable {  }

}
