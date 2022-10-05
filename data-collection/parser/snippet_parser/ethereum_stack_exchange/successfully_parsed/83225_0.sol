pragma solidity ^0.6.0;

import "github.com/smartcontractkit/chainlink/evm-contracts/src/v0.6/ChainlinkClient.sol";

contract GetData is ChainlinkClient {
  uint256 public currentPrice;
  address public owner;

  address ORACLE = 0x83F00b902cbf06E316C95F51cbEeD9D2572a349a;
  string constant JOB = "c179a8180e034cf5a341488406c32827";
  uint256 constant private ORACLE_PAYMENT = 1 * LINK;

  constructor() public {
    setPublicChainlinkToken();
    owner = msg.sender;
  }

  function requestEthereumPrice() 
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(stringToBytes32(JOB), address(this), this.fulfill.selector);
    req.add("get", "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD");
    req.add("path", "USD");
    req.addInt("times", 100);
    sendChainlinkRequestTo(ORACLE, req, ORACLE_PAYMENT);
  }

  function fulfill(bytes32 _requestId, uint256 _price)
    public
    recordChainlinkFulfillment(_requestId)
  {
    currentPrice = _price;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function stringToBytes32(string memory source) private pure returns (bytes32 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
      return 0x0;
    }
    assembly { 
      result := mload(add(source, 32))
    }
  }
}
