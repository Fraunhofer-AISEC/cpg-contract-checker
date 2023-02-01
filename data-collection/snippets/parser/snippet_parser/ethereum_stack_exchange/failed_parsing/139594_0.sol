 {
    require(msg.value == publicPrice, ""); 
    _mint(msg.sender,account, id, amount, "");
} 
}


    function uri(uint256 _tokenId) override public view returns (string memory){
      return string(
         abi.encodePacked(
             "http://arweave.net/F-vNncRtEDQADLijhtpINmObAprB0saDk9zj1CKMqa4/cloud",
             Strings.toString(_tokenId),
             ".json"
         )  

      );

    }

 function setURI(string memory newuri) public onlyOwner {
    _setURI(newuri);
}

function pause() public onlyOwner {
    _pause();
}

function unpause() public onlyOwner {
    _unpause();
}

function mint(address account, uint256 id, uint256 amount)
    public
    payable


function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
    public
    onlyOwner
{
    _mintBatch(to, ids, amounts, data);
}

function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
    internal
    whenNotPaused
    override(ERC1155, ERC1155Supply)
{
    super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
}
