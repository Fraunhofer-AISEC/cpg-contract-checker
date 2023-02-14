contract TutorialToken is StandardToken {
    string public name = 'TutorialToken';
    string public symbol = 'TT';
    uint public decimals = 2;
    uint public INITIAL_SUPPLY = 12000;

    function TutorialToken() {
        totalSupply = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }

    
    struct Doc {
        address seller;
        int docId;
        int priceByToken;
    }
    Doc[] Docs;

    function listDoc(int docId, int priceByToken) {
        
    }

    mapping (address => Doc) Transactions;

    function buy(address buyer, address seller, int docId) {
        
        transfer(seller, ..., buyer);
    }
}
