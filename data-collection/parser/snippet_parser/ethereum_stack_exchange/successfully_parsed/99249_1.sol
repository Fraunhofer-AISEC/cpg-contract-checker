pragma solidity ^0.5.16;

import "./DeedRepository.sol";


contract AuctionRepository {
    
    Auction[] public auctions;

    
    mapping(uint256 => Bid[]) public auctionBids;

    
    mapping(address => uint256[]) public auctionOwner;

    
    struct Bid {
        address payable from;
        uint256 amount;
    }

    
    struct Auction {
        string name;
        uint256 blockDeadline;
        uint256 startPrice;
        string metadata;
        uint256 deedId;
        address deedRepositoryAddress;
        address payable owner;
        bool active;
        bool finalized;
    }

    
    modifier isOwner(uint256 _auctionId) {
        require(auctions[_auctionId].owner == msg.sender);
        _;
    }

    
    modifier contractIsDeedOwner(
        address _deedRepositoryAddress,
        uint256 _deedId
    ) {
        address deedOwner =
            DeedRepository(_deedRepositoryAddress).ownerOf(_deedId);
        require(deedOwner == address(this));
        _;
    }

    
    function() external {
        revert();
    }

    
    function getCount() public view returns (uint256) {
        return auctions.length;
    }

    
    function getBidsCount(uint256 _auctionId) public view returns (uint256) {
        return auctionBids[_auctionId].length;
    }

    
    function getAuctionsOf(address _owner)
        public
        view
        returns (uint256[] memory)
    {
        uint256[] memory ownedAuctions = auctionOwner[_owner];
        return ownedAuctions;
    }

    
    function getCurrentBid(uint256 _auctionId)
        public
        view
        returns (uint256, address)
    {
        uint256 bidsLength = auctionBids[_auctionId].length;
        
        if (bidsLength > 0) {
            Bid memory lastBid = auctionBids[_auctionId][bidsLength - 1];
            return (lastBid.amount, lastBid.from);
        }
        return (uint256(0), address(0));
    }

    
    function getAuctionsCountOfOwner(address _owner)
        public
        view
        returns (uint256)
    {
        return auctionOwner[_owner].length;
    }

    
    function getAuctionById(uint256 _auctionId)
        public
        view
        returns (
            string memory name,
            uint256 blockDeadline,
            uint256 startPrice,
            string memory metadata,
            uint256 deedId,
            address deedRepositoryAddress,
            address owner,
            bool active,
            bool finalized
        )
    {
        Auction memory auc = auctions[_auctionId];
        return (
            auc.name,
            auc.blockDeadline,
            auc.startPrice,
            auc.metadata,
            auc.deedId,
            auc.deedRepositoryAddress,
            auc.owner,
            auc.active,
            auc.finalized
        );
    }

    
    function createAuction(
        address _deedRepositoryAddress,
        uint256 _deedId,
        string memory _auctionTitle,
        string memory _metadata,
        uint256 _startPrice,
        uint256 _blockDeadline
    )
        public
        contractIsDeedOwner(_deedRepositoryAddress, _deedId)
        returns (bool)
    {
        uint256 auctionId = auctions.length;
        Auction memory newAuction;
        newAuction.name = _auctionTitle;
        newAuction.blockDeadline = _blockDeadline + now;
        newAuction.startPrice = _startPrice;
        newAuction.metadata = _metadata;
        newAuction.deedId = _deedId;
        newAuction.deedRepositoryAddress = _deedRepositoryAddress;
        newAuction.owner = msg.sender;
        newAuction.active = true;
        newAuction.finalized = false;

        auctions.push(newAuction);
        auctionOwner[msg.sender].push(auctionId);

        emit AuctionCreated(msg.sender, auctionId);
        return true;
    }

    function approveAndTransfer(
        address _from,
        address _to,
        address _deedRepositoryAddress,
        uint256 _deedId
    ) internal returns (bool) {
        DeedRepository remoteContract = DeedRepository(_deedRepositoryAddress);
        remoteContract.approve(_to, _deedId);
        remoteContract.transferFrom(_from, _to, _deedId);
        return true;
    }

    
    function cancelAuction(uint256 _auctionId) public isOwner(_auctionId) {
        Auction memory myAuction = auctions[_auctionId];
        uint256 bidsLength = auctionBids[_auctionId].length;

        
        if (bidsLength > 0) {
            Bid memory lastBid = auctionBids[_auctionId][bidsLength - 1];
            if (!lastBid.from.send(lastBid.amount)) {
                revert();
            }
        }

        
        if (
            approveAndTransfer(
                address(this),
                myAuction.owner,
                myAuction.deedRepositoryAddress,
                myAuction.deedId
            )
        ) {
            auctions[_auctionId].active = false;
            emit AuctionCanceled(msg.sender, _auctionId);
        }
    }

    
    function finalizeAuction(uint256 _auctionId) public {
        Auction memory myAuction = auctions[_auctionId];
        uint256 bidsLength = auctionBids[_auctionId].length;

        
        if (block.timestamp < myAuction.blockDeadline) revert();

        
        if (bidsLength == 0) {
            cancelAuction(_auctionId);
        } else {
            
            Bid memory lastBid = auctionBids[_auctionId][bidsLength - 1];
            if (!myAuction.owner.send(lastBid.amount)) {
                revert();
            }

            
            if (
                approveAndTransfer(
                    address(this),
                    lastBid.from,
                    myAuction.deedRepositoryAddress,
                    myAuction.deedId
                )
            ) {
                auctions[_auctionId].active = false;
                auctions[_auctionId].finalized = true;
                emit AuctionFinalized(msg.sender, _auctionId);
            }
        }
    }

    
    function bidOnAuction(uint256 _auctionId) external payable {
        uint256 ethAmountSent = msg.value;

        
        Auction memory myAuction = auctions[_auctionId];
        if (myAuction.owner == msg.sender) revert();

        
        if (block.timestamp > myAuction.blockDeadline) revert();

        uint256 bidsLength = auctionBids[_auctionId].length;
        uint256 tempAmount = myAuction.startPrice;
        Bid memory lastBid;

        
        if (bidsLength > 0) {
            lastBid = auctionBids[_auctionId][bidsLength - 1];
            tempAmount = lastBid.amount;
        }

        
        if (ethAmountSent < tempAmount) revert();

        
        if (bidsLength > 0) {
            if (!lastBid.from.send(lastBid.amount)) {
                revert();
            }
        }

        
        Bid memory newBid;
        newBid.from = msg.sender;
        newBid.amount = ethAmountSent;
        auctionBids[_auctionId].push(newBid);
        emit BidSuccess(msg.sender, _auctionId);
    }

    event BidSuccess(address _from, uint256 _auctionId);

    
    event AuctionCreated(address _owner, uint256 _auctionId);

    
    event AuctionCanceled(address _owner, uint256 _auctionId);

    
    event AuctionFinalized(address _owner, uint256 _auctionId);
}
