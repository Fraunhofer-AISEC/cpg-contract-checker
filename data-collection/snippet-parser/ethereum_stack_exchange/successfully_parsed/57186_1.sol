    contract OwlOwnership is ERC721, OwlHatchery {


  using SafeMath for uint256;

  modifier onlyOwnerOf(uint _owlId) {
    require(msg.sender == owlToOwner[_owlId]);
    _;
  }

  mapping (uint => address) owlApprovals;

  function implementsERC721() public pure returns (bool) {
        return true;
    }

  function balanceOf(address _owner) public view returns (uint256 _balance) {
    return ownerOwlCount[_owner];
  }

  function ownerOf(uint256 _tokenId) public view returns (address _owner) {
    return owlToOwner[_tokenId];
  }


    function _owns(address _claimant, uint256 _tokenId) internal view returns (bool){
        return owlToOwner[_tokenId] == _claimant;
    }


    function _approvedFor(address _claimant, uint256 _tokenId) internal view returns (bool){
        return owlApprovals[_tokenId] == _claimant;
    }

  function _transfer(address _from, address _to, uint256 _tokenId) private {
    ownerOwlCount[_to] = ownerOwlCount[_to].add(1);
    ownerOwlCount[msg.sender] = ownerOwlCount[msg.sender].sub(1);
    owlToOwner[_tokenId] = _to;
    Transfer(_from, _to, _tokenId);
  }

  function transfer(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
    _transfer(msg.sender, _to, _tokenId);
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
        require(_to != address(0));
        require(_to != address(this));
        require(_approvedFor(msg.sender, _tokenId));
        require(_owns(_from, _tokenId));
        _transfer(_from, _to, _tokenId);
    }

  function approve(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
    owlApprovals[_tokenId] = _to;
    Approval(msg.sender, _to, _tokenId);
  }

  function takeOwnership(uint256 _tokenId) public {
    require(owlApprovals[_tokenId] == msg.sender);
    address owner = ownerOf(_tokenId);
    _transfer(owner, msg.sender, _tokenId);
  }
}
