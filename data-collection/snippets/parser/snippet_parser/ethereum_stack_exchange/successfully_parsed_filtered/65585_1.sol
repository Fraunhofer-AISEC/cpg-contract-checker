contract Caller {
    mapping(uint256 => address) public ERC721Address;
    using Address for address;
    bytes4 constant ERC721_RECEIVED = 0xf0b9e5ba;

    struct ERCs {
        address owner;
    }

    ERCs[] public ercs;

    function create(
        string _name,
        string _symbol,
        string _tokenURI
    ) public returns(bool) {
        ERCs memory _ercs = ERCs({
            owner: msg.sender
        });
        uint256 contractId = ercs.push(_ercs) -1; 
        ERC721Address[contractId] = new SampleToken(msg.sender, _name, _symbol, _tokenURI);
        return true;
    }

    function tokenTransferTo(
        address _to,
        uint256 _contractId,
        uint256 _tokenId,
        bytes _data
    ) public {
        require(msg.sender == ownerAddress(_contractId, _tokenId), "You do not have a right to mint token.");
        SampleToken(ERC721Address[_contractId]).setApprovalForAll(msg.sender, true);
        safeTransferFrom(msg.sender, _to, _contractId, _tokenId, _data);
    }

    function ownerAddress(uint256 _contractId, uint256 _tokenId) public view returns(address) {
        return SampleToken(ERC721Address[_contractId]).ownerOf(_tokenId);
    }

    function safeTransferFrom(
        address _from,
        address _to,
        uint256 _contractId,
        uint256 _tokenId,
        bytes _data
    ) public {
        SampleToken(ERC721Address[_contractId]).transferFrom(_from, _to, _tokenId);
        
        require(checkAndCallSafeTransfer(_from, _to, _tokenId, _data));
    }

    function checkAndCallSafeTransfer(
        address _from,
        address _to,
        uint256 _tokenId,
        bytes _data
    ) internal returns (bool) {
        if (!_to.isContract()) {
          return true;
        }
        bytes4 retval = ERC721Holder(_to).onERC721Received(address(this), _from, _tokenId, _data);
        return (retval == ERC721_RECEIVED);
    }
}
