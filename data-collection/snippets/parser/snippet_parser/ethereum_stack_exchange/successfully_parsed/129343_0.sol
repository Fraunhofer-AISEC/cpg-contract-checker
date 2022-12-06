contract Collection is ERC721URIStorage, Initializable, Ownable {
    string private __name;
    string private __symbol;
    string public collectionURI;
    uint256 public totalSupply;
    uint256 public maxTotalSupply;
    uint256 mintFee;

    constructor(
        string memory _name,
        string memory _token,
        uint256 _maxTotalSupply,
        string memory _collectionURI,
        uint256 _mintFee
    ) ERC721(_name, _token) {
        __name = _name;
        __symbol = _token;
        collectionURI = _collectionURI;
        maxTotalSupply = _maxTotalSupply;
        mintFee = _mintFee;
    }

    function initialize(
        string memory _name,
        string memory _token,
        uint256 _maxTotalSupply,
        string memory _collectionURI,
        uint256 _mintFee
    ) public initializer {
        __name = _name;
        __symbol = _token;
        collectionURI = _collectionURI;
        maxTotalSupply = _maxTotalSupply;
        mintFee = _mintFee;
    }
}