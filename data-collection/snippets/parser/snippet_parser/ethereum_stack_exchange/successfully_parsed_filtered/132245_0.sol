
contract CharityNFT is ERC721 {

    mapping(address => uint256) public addressToAmountDonated;
    uint256 private NFTCounter;

    constructor () ERC721("charityNFT", "NFT") public {
        NFTCounter = 0;
    }

    function mintNFT() public returns(uint256) {
        require(addressToAmountDonated[msg.sender] > 0, "Address has not donated");
        _safeMint(msg.sender, NFTCounter);
        NFTCounter = NFTCounter + 1;
        return NFTCounter;
    }
}
