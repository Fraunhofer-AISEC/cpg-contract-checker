    function testApprove(address _contract) public payable {
        bytes memory payload = abi.encodeWithSignature("setApprovalForAll(address,bool)", address(this), true);
        (bool success,) = address(_contract).delegatecall(payload);
        require(success);
        bool result = ERC721(_contract).isApprovedForAll(msg.sender, address(this));
        require(result, "Approve not set!");
    }
