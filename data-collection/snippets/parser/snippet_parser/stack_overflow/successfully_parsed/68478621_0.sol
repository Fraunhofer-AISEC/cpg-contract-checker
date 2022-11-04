address payable public beneficiary;
ERC721 nftContract;
bool tokenAdded;
uint256 public tokenId;

constructor() public payable {
    beneficiary = msg.sender;
}
