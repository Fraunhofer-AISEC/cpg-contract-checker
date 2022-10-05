contract ContractA is ERC721URIStorage, Ownable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(string => uint256) image_hashes;

    constructor() public ERC721("DemoNFT", "DNFT") {}

    function mintNFT(address recipient, string memory tokenURI, string memory image_hash)
        public returns (uint256)
    {
        uint256 token = image_hashes[image_hash];
        require(token==0, "Same image already exists in the blockchain. You cannot create two NFTs of the same image");
      
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        image_hashes[image_hash] = newItemId;
        return newItemId;

    }

}

contract ContractB {

    function getBalance(ERC721 senderNftContract, address senderAddress) public view returns (uint256) {
        return senderNftContract.balanceOf(senderAddress);
    }
}