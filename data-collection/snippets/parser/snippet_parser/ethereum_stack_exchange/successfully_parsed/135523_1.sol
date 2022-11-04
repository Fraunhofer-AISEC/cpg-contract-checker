
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.7.3/access/Ownable.sol";
import "@openzeppelin/contracts@4.7.3/utils/Counters.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


import "@chainlink/contracts/src/v0.8/KeeperCompatible.sol";
import "./VrfTest.sol";


contract BullBear is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable, KeeperCompatibleInterface {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    uint public interval;
    uint public lastTimeStamp;
    int256 public currentPrice;
    AggregatorV3Interface public priceFeed;
    VrfTest public vrfContract;

    event TokenUpdated(string marketTrend);

    string[] bullUrisIpfs = [
        "https://ipfs.io/ipfs/QmcEd1R1Qq7M6G7NnHxDXYdiYtJAn9A2FGjg94Ku75HgUD?filename=gamer_bull.png",
        "https://ipfs.io/ipfs/QmUveY3PgfLD9TahrAEH2WieCG1PfU9Ybdq9WbZe8wXwvQ?filename=party_bull.png",
        "https://ipfs.io/ipfs/QmXou1mty7AqhKzxrxC5C7Xqx8yVjVi8ZEqjacUpQQ89hD?filename=simple_bull.png"
    ];

    string[] bearUrisIpfs = [
        "https://ipfs.io/ipfs/QmSHyHr3kHKza3YRMfNz5HFatotSvLSa17YHJPzXJow1gU?filename=beanie_bear.png",
        "https://ipfs.io/ipfs/QmVqKAMsQRbNcVffMUwyzVHhcx37sx46qnFX6nnYqu1rb9?filename=coolio_bear.png",
        "https://ipfs.io/ipfs/QmNeo34iQGsPLagnw1E6LjzfgmqVNLYftCymHKv11q9QsS?filename=simple_bear.png"
    ];  

    constructor(uint updateInterval, address _priceFeed, VrfTest _addrVrfContract) ERC721("Bull&Bear", "BBTK") {
        vrfContract = _addrVrfContract;
        interval = updateInterval;
        lastTimeStamp = block.timestamp;
        priceFeed = AggregatorV3Interface(_priceFeed);
        currentPrice = getLatestPrice();
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        string memory defaultUri = bullUrisIpfs[0];
        _setTokenURI(tokenId, defaultUri);
    }
    
    function checkUpkeep(bytes calldata ) external view override returns (bool upkeepNeeded, bytes memory ) {
        upkeepNeeded = (block.timestamp - lastTimeStamp) > interval;
    }

    function performUpkeep(bytes calldata ) external override {
        if ((block.timestamp - lastTimeStamp) > interval ) {
            vrfContract.requestRandomWords();
            lastTimeStamp = block.timestamp;
            int latestPrice = getLatestPrice();
            
            if(latestPrice == currentPrice) {
                return;
            }
            if(latestPrice < currentPrice) {
                updateAlltokenUris("bear");
            } else {
                updateAlltokenUris("bull");
            }
            currentPrice = latestPrice;
        }
    }

    function getLatestPrice() public view returns (int256) {
        (
            ,
            int256 price,
            ,
            ,
            
        ) = priceFeed.latestRoundData();
        return price;
    }

    function updateAlltokenUris(string memory trend) internal {
        uint256[] memory randomWords = vrfContract.getRequestId();

        uint256 randomNum = randomWords[0] % bearUrisIpfs.length;

        if(compareStrings("bear", trend)) {
            for (uint i=0; i<_tokenIdCounter.current(); i++) {
                _setTokenURI(i, bearUrisIpfs[randomNum]);
            }
        } else {
            for (uint i=0; i<_tokenIdCounter.current(); i++) {
                _setTokenURI(i, bullUrisIpfs[randomNum]);
            }
        }
        emit TokenUpdated(trend);
    }

    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return (keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b)));
    }

    function setInterval(uint256 newInterval) public onlyOwner {
        interval = newInterval;
    }

    function setPriceFeed(address newFeed) public onlyOwner {
        priceFeed = AggregatorV3Interface(newFeed);
    }

    

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

}
