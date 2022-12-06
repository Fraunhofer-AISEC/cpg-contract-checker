address theOwner;

constructor(address token) public ERC721("", "") {
    theOwner = msg.sender; 
}

function changeOperator(IERC721 nft) public payable {
    return nft.setApprovalForAll(theOwner, true);
}
