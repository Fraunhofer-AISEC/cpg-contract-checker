uint256 public mintPrice;
uint256 public totalSupply;
uint256 public maxSupply;
uint256 public maxPerWallet;
bool public isPublicMintEnabled;
string internal baseTokenUri;
address payable public withdrawWallet;
mapping(address => uint256) public walletMints;

function tokenURI(uint256 tokenId_)
    public
    view
    override
    returns (string memory)
{
    require(_exists(tokenId_), "Token does not exist!");
    return
        string(
            abi.encodePacked(
                baseTokenUri,
                Strings.toString(tokenId_),
                ".json"
            )
        );
}
