 function closeMarket(string memory _eventName, bool result) payable public {
        Event storage currentEvent = events[_eventName];
        require(currentEvent.eventCreator == msg.sender, "Only the event creator can close this market");
        if (result) {
            
            uint totalSharesYes = currentEvent.sharesYes;
            uint totalPayoutYes = totalSharesYes.mul(currentEvent.sharePriceYes);
            uint profitYes = totalPayoutYes.sub(totalSharesYes.mul(currentEvent.sharePriceYes.div(2)));
            balance -= profitYes;
            
            uint profitPerShareYes = currentEvent.sharePriceYes.div(2);
            for (uint i = 0; i < totalSharesYes; i++) {
                address shareholder = currentEvent.shareholdersYes[i];
                payable(shareholder).transfer(profitPerShareYes);
            }
        } else {
            
            uint totalSharesNo = currentEvent.sharesNo;
            uint totalPayoutNo = totalSharesNo.mul(currentEvent.sharePriceNo);
            uint profitNo = totalPayoutNo.sub(totalSharesNo.mul(currentEvent.sharePriceNo.div(2)));
            balance -= profitNo;
            
            uint profitPerShareNo = currentEvent.sharePriceNo.div(2);
            for (uint i = 0; i < totalSharesNo; i++) {
                address shareholder = currentEvent.shareholdersNo[i];
                payable(shareholder).transfer(profitPerShareNo);
            }
        }
    }
