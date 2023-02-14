pragma solidity ^0.6.0;

import "github.com/smartcontractkit/chainlink/evm-contracts/src/v0.6/ChainlinkClient.sol";


contract GetData is ChainlinkClient {
    uint256 indexOfWinner;
    address public manager;
    address payable[] public players;
    uint256 MINIMUM = 1000000000000000;
  
  
    address ORACLE=0x83F00b902cbf06E316C95F51cbEeD9D2572a349a;
    
    bytes32 JOB= "c179a8180e034cf5a341488406c32827";
    uint256 ORACLE_PAYMENT = 1 * LINK;

  constructor() public {
    setPublicChainlinkToken();
    manager = msg.sender;
  }

function getWinnerAddress() 
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(JOB, address(this), this.fulfill.selector);
    req.add("get", "example-winner.com/winner");
    req.add("path", "winner");
    sendChainlinkRequestTo(ORACLE, req, ORACLE_PAYMENT);
  }

  
  function fulfill(bytes32 _requestId, uint256 _index)
    public
    recordChainlinkFulfillment(_requestId)
  {
    indexOfWinner = _index;
    assert(msg.sender == manager);
    players[indexOfWinner].transfer(address(this).balance);
    players = new address payable[](0);
  }
  
  function enter() public payable{
        assert(msg.value > MINIMUM);
        players.push(msg.sender);
    } 
    
  modifier onlyOwner() {
    require(msg.sender == manager);
    _;
  }
    
    
  function withdrawLink() external onlyOwner() {
    LinkTokenInterface _link = LinkTokenInterface(chainlinkTokenAddress());
    require(_link.transfer(msg.sender, _link.balanceOf(address(this))), "Unable to transfer");
  }
  
  
}
