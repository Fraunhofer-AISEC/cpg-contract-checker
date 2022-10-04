  function transfer(address _to, uint _tokenId)
        public
        onlyExtantToken(_tokenId)
    {

        require((ownerOf(_tokenId) == msg.sender));
        require(_to != address(0));

        _clearApprovalAndTransfer(msg.sender, _to, _tokenId);

        Approval(msg.sender, 0, _tokenId);
        Transfer(msg.sender, _to, _tokenId);
    }
