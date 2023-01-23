solidity
pragma solidity ^0.6.0;
import "github.com/smartcontractkit/chainlink/evm-contracts/src/v0.6/ChainlinkClient.sol";
contract testingData is ChainlinkClient {
  address public owner;
  uint256 public btc;
  address ORACLE =  0xB36d3709e22F7c708348E225b20b13eA546E6D9c;
  bytes32 constant JOB = "f9528decb5c64044b6b4de54ca7ea63e";
  uint256 constant private ORACLE_PAYMENT = 1 * LINK;
  constructor() public {
    setPublicChainlinkToken();
    owner = msg.sender;
  }
  function getBTCPrice() 
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(JOB, address(this), this.fulfill.selector);
    req.add("get", "https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=BTC&to_currency=USD&apikey=xxxx");
    string[] memory copyPath = new string[](2);
    copyPath[0] = "Realtime Currency Exchange Rate";
    copyPath[1] = "5. Exchange Rate";
    sendChainlinkRequestTo(ORACLE, req, ORACLE_PAYMENT);
  }
  function fulfill(bytes32 _requestId, uint256 _price)
    public
    recordChainlinkFulfillment(_requestId)
  {
    btc = _price;
  }
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
}
