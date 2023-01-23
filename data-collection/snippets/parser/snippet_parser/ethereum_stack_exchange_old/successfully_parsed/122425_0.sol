pragma solidity ^0.7.0;

contract TestNFTContract is ERC721, Ownable {
    using SafeMath for uint256;


    uint256 public salePrice = 50000000000000000; 

    uint256 public constant maxNFTPurchase = 20;

    uint256 public constant MAX_TEST_NFT = 10000;

    bool public saleIsActive = false;

    uint256 public testNFTReserve = 100; 

   

    constructor() ERC721("Test Nft", "TESTNFT") {}

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        msg.sender.transfer(balance);
    }

    function reserveNFTs(address _to, uint256 _reserveAmount)
        public
        onlyOwner
    {
        uint256 supply = totalSupply();
        require(
            _reserveAmount > 0 && _reserveAmount <= testNFTReserve,
            "Not enough reserve left for team"
        );
        for (uint256 i = 0; i < _reserveAmount; i++) {
            _safeMint(_to, supply + i);
        }
        testNFTReserve = testNFTReserve.sub(_reserveAmount);
    }


    function setBaseURI(string memory baseURI) public onlyOwner {
        _setBaseURI(baseURI);
    }

    function flipSaleState() public onlyOwner {
        saleIsActive = !saleIsActive;
    }



    function mintTestNFT(uint256 numberOfTokens) public payable {
        require(saleIsActive, "Sale must be active to mint NFT");
        require(
            numberOfTokens > 0 && numberOfTokens <= testNFTReserve,
            "Can only mint 20 tokens at a time"
        );
        require(
            totalSupply().add(numberOfTokens) <= MAX_TEST_NFT,
            "Purchase would exceed max supply of TEST NFTs"
        );
        require(
            msg.value >= salePrice.mul(numberOfTokens),
            "Ether value sent is not correct"
        );

        for (uint256 i = 0; i < numberOfTokens; i++) {
            uint256 mintIndex = totalSupply();
            if (totalSupply() < MAX_TEST_NFT) {
                _safeMint(msg.sender, mintIndex);
            }
        }
    }

    function setTestNftPrice(uint256 newPrice) public onlyOwner {
        salePrice = newPrice;
    }
}
