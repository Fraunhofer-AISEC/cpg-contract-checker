The transaction has been reverted to the initial state.
Reason provided by the contract: "ERC721: transfer caller is not owner nor approved".
Debug the transaction to get more information.


contract NftEscrow is IERC721Receiver {
    
    enum ProjectState {newEscrow, nftDeposited, cancelNFT, ethDeposited, canceledBeforeDelivery, deliveryInitiated, delivered}
    
    address payable public sellerAddress;
    address payable public buyerAddress;
    address public nftAddress;
    uint256 tokenID;
    bool buyerCancel = false;
    bool sellerCancel = false;
    ProjectState public projectState;

    receive() external payable {
    
     }

    constructor(){
        sellerAddress = payable(msg.sender);
        projectState = ProjectState.newEscrow;
    }
    
    function onERC721Received( address , address , uint256 , bytes calldata  ) public pure override returns (bytes4) {
        return this.onERC721Received.selector;
    }
    
    function depositNFT(address _NFTAddress, uint256 _TokenID) public onlySeller {
        nftAddress = _NFTAddress;
        tokenID = _TokenID;
        ERC721(nftAddress).safeTransferFrom(msg.sender, address(this), tokenID);
        projectState = ProjectState.nftDeposited;
    }

    function depositEth() public payable {
        buyerAddress = payable(msg.sender);
        projectState = ProjectState.ethDeposited;
    }

    function confirmDelivery()public payable  {
        ERC721(nftAddress).safeTransferFrom(address(this), buyerAddress, tokenID);
        sellerAddress.transfer(address(this).balance);
    }
    

    modifier onlySeller() {
        require(msg.sender == sellerAddress);
        _;
    }

} 
 
