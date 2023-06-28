contract Exchange {

    struct Bid {
        address owner;
        uint price;
        uint amount;
        uint date;
    }

    struct Ask {
        address owner;
        uint price;
        uint amount;
        uint date;
    }

    Bid[] public Bids;
    Ask[] public Asks;
    Household hh;

    function ExistingHH(address _t) public {
        hh = Household(_t);
    }

    function deposit() public payable {
    }

    function () public payable{}       

    function submitBid(uint _price, uint _amount) external returns (bool) {
        Bid memory b;
        b.owner = msg.sender;
        b.price = _price;
        b.amount = _amount;
        b.date = now;
        for(uint i = 0; i < Bids.length; i++) {
            if(Bids[i].price > _price) {
                Bid[] memory tempBids = new Bid[](Bids.length - i);
                for(uint j = i; j < Bids.length; j++) {
                    tempBids[j-i] = Bids[j];
                }
                Bids[i] = b;
                Bids.length = Bids.length + 1;
                for(uint k = 0; k < tempBids.length; k++) {
                    Bids[i+k+1] = tempBids[k];
                }

                if(Bids[Bids.length-1].price >= Asks[Asks.length-1].price) {
                    matchBid(Asks.length-1, Bids.length-1);
                }
                return true;
            }
        }
        Bids.push(b);
        if(Asks.length > 0) {
            matchBid(Bids.length-1, Asks.length-1);
        }
        return true;
    }

    function submitAsk(uint _price, uint _amount) external returns (bool) {
        Ask memory a;
        a.owner = msg.sender;
        a.price = _price;
        a.amount = _amount;
        a.date = now;
        for (uint i = 0; i < Asks.length; i ++) {
            if(Asks[i].price < _price) {
                Ask[] memory tempAsks = new Ask[](Asks.length - i);
                for (uint j = i; j < Asks.length; j++) {
                    tempAsks[j-i] = Asks[j];
                }
                Asks[i] = a;
                Asks.length = Asks.length + 1;
                for (uint k = 0; k < tempAsks.length; k++) {
                    Asks[i+k+1] = tempAsks[k];
                }

                if(Bids[Bids.length-1].price >= Asks[Asks.length-1].price) {
                    matchBid(Asks.length-1, Bids.length-1);
                }
                return true;
            }
        }
        Asks.push(a);
        if(Bids.length > 0) {
            matchBid(Asks.length-1, Bids.length-1);
        }
        return true;
    }

    function matchBid(uint bid_index, uint ask_index) public payable returns (bool) {
        if (Bids[bid_index].amount <= 0 || Bids[bid_index].price < Asks[ask_index].price) {
            cleanAskLedger();
            return true;
        }

        hh = Household(Bids[bid_index].owner);
        
        uint price = Asks[ask_index].price + Bids[bid_index].price / 2;
        if(Bids[bid_index].amount - Asks[ask_index].amount >= 0){
            uint remainder = Bids[bid_index].amount - Asks[ask_index].amount;
            uint calcAmount = Bids[bid_index].amount - remainder;

            hh.buyEnergy(calcAmount, Asks[ask_index].owner, price);

            Bids[bid_index].amount = remainder;
            Asks[ask_index].amount = 0;

            cleanAskLedger();
            return true;
        }

        if(Bids[bid_index].amount - Asks[ask_index].amount < 0){
            calcAmount = Asks[ask_index].amount - remainder;

            hh.buyEnergy(calcAmount, Asks[ask_index].owner, price);

            Bids[bid_index].amount = 0;
            Asks[ask_index].amount = remainder;

            cleanBidLedger();
            return true;
        }
    }

    function cleanAskLedger() public returns (bool) {
        for(uint i = Asks.length - 1; i >= 0; i--) {
            if (Asks[i].amount == 0) {
                delete Asks[i];
            }
        }
        return true;
    }

    function cleanBidLedger() public returns (bool) {
        for(uint i = Bids.length -1; i >= 0; i--) {
            if(Bids[i].amount > 0) {
                delete Bids[i];
            }
        }
        return true;
    }

    function getBidsCount() public view returns(uint) {
        return Bids.length;
    }

    function getAsksCount() public view returns(uint) {
        return Asks.length;
    }
}
