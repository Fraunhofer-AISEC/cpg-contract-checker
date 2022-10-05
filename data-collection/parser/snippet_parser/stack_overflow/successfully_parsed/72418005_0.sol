import {Auction} from "./Acution.sol";

contract AuctionFactory {
    address[] public auctions;

    event AuctionCreated(address auctionContract, address owner, uint numAuctions, address[] allAuctions);

    function createAuction(uint bidIncrement, uint startTime, uint endTime, uint tokenId) public{
        Auction newAuction = new Auction(msg.sender, bidIncrement, startTime, endTime, tokenId);
        auctions.push(address(newAuction));

        emit AuctionCreated(address(newAuction), msg.sender, auctions.length, auctions);
    }

    function allAuctions() public view returns (address[] memory) {
        return auctions;
    }
}
