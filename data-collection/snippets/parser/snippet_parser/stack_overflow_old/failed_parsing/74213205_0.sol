contract ContractA is ERC721 {

   ...
   function mint(address _to, uint256 _mintAmount) public payable {
        for (uint256 i = 1; i <= _mintAmount; i++) {
            _safeMint(_to, supply + i);
        }
    }

}
