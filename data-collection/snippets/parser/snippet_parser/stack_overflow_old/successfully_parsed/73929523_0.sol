    pragma solidity ^0.8.7;
    import '@chainlink/contracts/src/v0.8/ChainlinkClient.sol';
    import '@chainlink/contracts/src/v0.8/ConfirmedOwner.sol';

    contract FetchFromArray is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    
    string public jsonData;
    bytes32 private jobId;
    uint256 private fee;
    User[] public users;    

    struct User{
      uint256 id;
      uint256 name;
      uint256 email;
      uint256 gender;
      uint256 status;
    }

    event GetUsersData(bytes32 indexed requestId, string jsonData);


    
    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        setChainlinkOracle(0xCC79157eb46F5624204f47AB42b3906cAA40eaB7);
        jobId = '7d80a6386ef543a3abb52817f6707e3b';
        fee = (1 * LINK_DIVISIBILITY) / 10; 
    }

    
    function getUser() public returns (bytes32 requestId){
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);

        
        req.add('get', 'https://gorest.co.in/public/v2/users');
        req.add('path', '$');
        
        return sendChainlinkRequest(req, fee);
    }

     
    function fulfill(bytes32 _requestId, string memory _jsonData) public recordChainlinkFulfillment(_requestId) {
        emit GetUsersData(_requestId,_jsonData);
        jsonData = _jsonData;
        
    }

     
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), 'Unable to transfer');
    }

    }
