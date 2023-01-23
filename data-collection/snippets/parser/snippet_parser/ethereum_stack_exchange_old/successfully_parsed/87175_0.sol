    contract A {
        using Counters for Counters.Counter;
        using SafeMath for uint256;
        Counters.Counter private _tokenIds;
        address public nftContract;

        constructor(address _nftContract) public {
         nftContract = _nftContract;
        }

        function mintItem() public returns (uint256) {
                _tokenIds.increment();
        
                uint256 newItemId = _tokenIds.current();
    
    nftContract.delegatecall(abi.encodeWithSignature("safeMint(address,uint256)",msg.sender,newItemid));
                }
}

contract B is ERC721 {

    address public owner;
    modifier onlyOwner() {
        require(owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    constructor(string memory name,string memory ticker,string memory uri) ERC721(name,ticker) public {
      owner = msg.sender;
      _setBaseURI(uri);
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner{
      _mint(to, tokenId);
    }

}
