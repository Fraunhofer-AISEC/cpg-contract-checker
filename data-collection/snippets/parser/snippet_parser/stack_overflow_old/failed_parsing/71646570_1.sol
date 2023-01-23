import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

    
    contract nftescrow is IERC721Receiver {
        
        enum ProjectState {newEscrow, nftDeposited, cancelNFT, ethDeposited, canceledBeforeDelivery, deliveryInitiated, delivered}
        
        address payable public sellerAddress;
        address payable public buyerAddress;
        address public nftAddress;
        uint256 tokenID;
        bool buyerCancel = false;
        bool sellerCancel = false;
        ProjectState public projectState;
    
        constructor()
        {
            sellerAddress = payable(msg.sender);
            projectState = ProjectState.newEscrow;
        }
        
        function onERC721Received( address operator, address from, uint256 tokenId, bytes calldata data ) public override returns (bytes4) {
            return this.onERC721Received.selector;
        }
        
        function depositNFT(address _NFTAddress, uint256 _TokenID)
            public
            inProjectState(ProjectState.newEscrow)
            onlySeller
        {
            nftAddress = _NFTAddress;
            tokenID = _TokenID;
            ERC721(nftAddress).safeTransferFrom(msg.sender, address(this), tokenID);
            projectState = ProjectState.nftDeposited;
        }
    } 
    
    }
