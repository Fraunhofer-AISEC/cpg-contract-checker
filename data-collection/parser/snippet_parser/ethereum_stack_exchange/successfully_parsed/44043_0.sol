  pragma solidity ^0.4.18;


    contract Music {

        address public buyer;
        address public seller;

        bool public buyerPlayed;
        bool public sellerPlayed;

        uint private buyerDeposit;
        uint private sellerDeposit;

        bool public transactionFinished; 
        address public theNewOwner;
        string gains;


        event AuctionStartsEvent(address buyer, address seller);
        event EndOfAuctionEvent(address owner, string gains);

        function Auctioning() public {
            buyer = msg.sender;
        }


        function registerAsABuyer() public {
            require(seller == address(0));

            seller = msg.sender;

            emit AuctionStartsEvent(buyer, seller);
        }


        function auction() public payable {
            require(!transactionFinished && (msg.sender == buyer || msg.sender == seller));

            if(msg.sender == buyer) {
                require(buyerPlayed == false);
                buyerPlayed = true;
                buyerDeposit = buyerDeposit + msg.value;
            } else { 
                require(sellerPlayed == false);
                sellerPlayed = true;
                sellerDeposit = sellerDeposit + msg.value;
            }
            if(buyerPlayed && sellerPlayed) {
                if(buyerDeposit >= sellerDeposit * 2) {
                    endOfAuction(buyer);
                } else if (sellerDeposit >= buyerDeposit * 2) {
                    endOfAuction(seller);
                }
            }
        }


        function endOfAuction(address owner) internal {
            transactionFinished = true;
            theNewOwner = owner;

            gains = "You have recived your song!";
            emit EndOfAuctionEvent(owner, gains);
        }

    }
