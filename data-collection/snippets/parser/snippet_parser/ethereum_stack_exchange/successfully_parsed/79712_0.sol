contract Auction {

    
    
    struct Item {
        uint itemId; 
        uint[] itemTokens; 
    }

    
    struct Person {
        uint remainingTokens; 
        uint personId; 
        address payable addr; 
    }

    mapping(address => Person) tokenDetails; 
    
    Person[] bidders; 

    
    Item[] public items; 
    
    address[] public winners; 
    address payable public beneficiary; 

    event BidEvent(address addr, uint itemId, uint count, uint balance);

    

    constructor() public payable { 
        beneficiary = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == beneficiary);
        _;
    }
    function fillitems(uint _itemCount) public payable onlyOwner {
        winners.length = 0;
        items.length = 0;

        uint[] memory emptyArray;

        for (uint i = 0; i < _itemCount; i++) {
            items.push(Item({
                itemId: i,
                itemTokens: emptyArray
            }));
        }

    }


    function register(address payable _addr_bidder, uint _remainingTokens) public payable {

        uint bidderCount = bidders.length;

        for (uint id = 0; id < bidderCount; id++) {
            if (bidders[id].addr == _addr_bidder) {
                revert();
            }
        }

        bidders.push(Person({
            remainingTokens: _remainingTokens,
            personId: bidderCount,
            addr: _addr_bidder
        }));
        tokenDetails[_addr_bidder] = bidders[bidderCount];

    }


    
    

    


    
    
    

    function bid(uint _itemId, uint _count) public payable {
        

        if (_itemId > items.length - 1) {
            revert();
        }

         if (tokenDetails[msg.sender].remainingTokens == 0) {
            revert();
        }

        if (tokenDetails[msg.sender].remainingTokens < _count) {
            revert();
        }

        Item storage bidItem = items[_itemId];
        if(items[_itemId].itemTokens.length>0){

            if(CountTokens(items[_itemId].itemTokens) >=  _count){
            revert();
            }
            else{

                uint returnId = mode(items[_itemId].itemTokens);
                uint returnTokens = CountTokens(items[_itemId].itemTokens);

                Person storage bidPerson = bidders[returnId];
                uint currentbalance = tokenDetails[bidPerson.addr].remainingTokens + returnTokens;
                tokenDetails[bidPerson.addr].remainingTokens=currentbalance;
                delete bidItem.itemTokens;

            }
        }
        uint balance = tokenDetails[msg.sender].remainingTokens - _count;


        tokenDetails[msg.sender].remainingTokens = balance;
        bidders[tokenDetails[msg.sender].personId].remainingTokens = balance; 

        for (uint i = 0; i < _count; i++) {
            bidItem.itemTokens.push(tokenDetails[msg.sender].personId);
        }

        emit BidEvent(msg.sender, _itemId, _count, balance);
    }




    function revealWinners() public onlyOwner {

        winners.length = 0;
        address addr;

        for (uint id = 0; id < items.length; id++) {
            Item storage currentItem = items[id];
            addr = address(0);
            if (currentItem.itemTokens.length != 0) {
                
                uint randomIndex = mode(currentItem.itemTokens);
                addr = bidders[randomIndex].addr;
            }
            winners.push(addr);
        }
    }

    function mode(uint256[] memory array) public pure returns(uint) {
        uint[] memory count = new uint[](array.length);
        uint number;
        uint maxIndex = 0;
        

        for (uint i = 0; i < array.length; i += 1) {
            number = array[i];
            count[number] = (count[number]) + 1;
            if (count[number] > count[maxIndex]) {
                maxIndex = number;
            }
        }

        return maxIndex;
    }

    function CountTokens(uint256[] memory array) public pure returns(uint) {
        uint[] memory count = new uint[](array.length);
        uint number;
        uint maxIndex = 0;
        

        for (uint i = 0; i < array.length; i += 1) {
            number = array[i];
            count[number] = (count[number]) + 1;
            if (count[number] > count[maxIndex]) {
                maxIndex = number;
            }
        }

        return count[number];
    }

    function getSender() public view returns(address) {
        return (msg.sender);

    }

    function getLenItems() public view returns(uint) {
        return (items.length);

    }

    function getLenWinners() public view returns(uint) {
        return (winners.length);

    }

    function getWinner(uint id) public view returns(address) {
        return (winners[id]);

    }


    
    function getPersonDetails(uint id) public view returns(uint, uint, address) {
        return (bidders[id].remainingTokens, bidders[id].personId, bidders[id].addr);
    }

}
