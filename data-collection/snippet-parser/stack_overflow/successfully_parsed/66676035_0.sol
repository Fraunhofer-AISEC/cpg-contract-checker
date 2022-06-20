pragma solidity 0.7.4;
pragma experimental ABIEncoderV2;

mapping(uint => ProductWithBids) public internalProducts;

struct SecretBids {
        uint values;
        bool fake;
        string secret;
    }

struct ProductWithBids {
        uint id;
        string name;
        uint price;
        address payable owner;
        address payable beneficiary;
        bool purchased;

        mapping(address => Bid[]) bids;
        mapping(address => SecretBids[]) nakedBids;
        
        mapping(address => uint) pendingReturns;

        uint bidsCount;

        bool ended;
        uint biddingEnd;
        uint revealEnd;

        address highestBidder;
        uint highestBid;
    }

function getNakedBids(uint _id)
    public
    view
    returns(SecretBids[] memory product) {
        ProductWithBids storage selectedProduct = internalProducts[_id];
        return selectedProduct.nakedBids;
    }
