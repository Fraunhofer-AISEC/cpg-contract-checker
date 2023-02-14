constructor( string memory _name, string memory _symbol, address nftAddr) ERC20(_name, _symbol) {
nft = IERC721(nftAddr);
}
function transfer() public {
    
    nft.transferFrom(msg.sender, address(this), nftId); 
 }
