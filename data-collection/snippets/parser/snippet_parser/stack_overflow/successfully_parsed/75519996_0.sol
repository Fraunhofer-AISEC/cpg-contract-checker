
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract MyToken is ERC721, ChainlinkClient, ConfirmedOwner {

    using Chainlink for Chainlink.Request;

    string public id;

    bytes32 private jobId;
    uint256 private fee;

    event RequestDataJson(bytes32 indexed requestId, string id);

    

    constructor() ERC721("MyToken", "MTK") ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        setChainlinkOracle(0xCC79157eb46F5624204f47AB42b3906cAA40eaB7);
        jobId = "7d80a6386ef543a3abb52817f6707e3b";
        fee = (1 * LINK_DIVISIBILITY) / 10; 
    }    

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }

      
    function requestDataJson() public returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfill.selector
        );
        
        
        req.add(
            "get",
            "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=10"
        );

        
        
        
        
        
        
        
        
        
        
        req.add("path", "0,id"); 
        req.add("path", "0,symbol");
        req.add("path", "0,name");
        req.add("path", "0,image");
        
        return sendChainlinkRequest(req, fee);
    }

     
    function fulfill(
        bytes32 _requestId,
        string memory _id
    ) public recordChainlinkFulfillment(_requestId) {
        emit RequestDataJson(_requestId, _id);
        id = _id;
    }

    
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(
            link.transfer(msg.sender, link.balanceOf(address(this))),
            "Unable to transfer"
        );
    }
}

