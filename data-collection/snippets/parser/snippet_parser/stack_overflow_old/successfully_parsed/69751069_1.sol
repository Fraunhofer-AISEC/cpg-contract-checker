import "./Main.sol";

contract Auction is Main {
    struct AuctionInfo {
        uint256 tokenId;
        address highestBidder;
        uint highestBid;
    }

    mapping(string => AuctionInfo) private _auctionInfo;

    function createAuction(string memory id) public {
        _tokenIds.increment();

        uint256 newTokenId = _tokenIds.current();
        _mint(msg.sender, newTokenId);
        
        _auctionInfo[id].tokenId = newTokenId;
    }

    function transferToken(string memory id) public {
        require(msg.sender == _auctionInfo[id].highestBidder, "You are not the highest bidder");

        safeTransferFrom(address(this), _auctionInfo[id].highestBidder, _auctionInfo[id].tokenId);
    }

    
}
