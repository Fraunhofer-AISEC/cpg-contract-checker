import "./VrfTest.sol";


contract BullBear is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable, KeeperCompatibleInterface {
    
    VrfTest public vrfContract;

    constructor(uint updateInterval, address _priceFeed, VrfTest _addrVrfContract) ERC721("Bull&Bear", "BBTK") {
        vrfContract = _addrVrfContract;

    }
}