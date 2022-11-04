
response
bytes public data;
bytes public imgdata;
string public image;
string public name;

bytes32 private jobId;
uint256 private fee;


constructor() ConfirmedOwner(msg.sender) {
    setChainlinkToken(0x01BE23585060835E02B77ef475b0Cc51aA1e0709);
    setChainlinkOracle(0xf3FBB7f3391F62C8fe53f89B41dFC8159EE9653f);
    jobId = '7da2702f37fd48e5b1b9a5715e3509b6';
    fee = (1 * LINK_DIVISIBILITY) / 10; 
}


function requestBytes() public {
    Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), 
    this.fulfillBytes.selector);
    req.add(
        'get', 
        'https://ipfs.io/ipfs/QmWBxuuuqDxjiSvHsf52bQVkQ7Sqv1dLx4DJPFZ4KdsHGZ/1.json'
    );
    req.add('path', 'name');
    req.add('path', 'image');
    sendChainlinkRequest(req, fee);
}

event RequestFulfilled(bytes32 indexed requestId, bytes indexed data, bytes indexed 
imgdata);


function fulfillBytes(bytes32 requestId, bytes memory bytesData, bytes memory 
    imgdata_) public recordChainlinkFulfillment(requestId) {
    emit RequestFulfilled(requestId, bytesData, imgdata_);
    data = bytesData;
    name = string(data);
    imgdata = imgdata_;
    image = string(imgdata);
}


function withdrawLink() public onlyOwner {
    LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
    require(link.transfer(msg.sender, link.balanceOf(address(this))), 'Unable to 
    transfer');
}
