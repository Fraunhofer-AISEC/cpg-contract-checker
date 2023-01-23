
struct Vote {
    bool used;
    bool forSale;
    uint price;
    address payable owner;
}
mapping(address => Vote) private votes; 

...

     
    function sellVote(address _voteAddr, uint price) public notVoted(_voteAddr) ownsVote(_voteAddr) {
        require(price > 0, "Price must be higher than 0");

        Vote storage _vote = votes[_voteAddr];
        _vote.price = price;
        _vote.forSale = true;

        emit VoteForSale(_voteAddr, price);
    }


    
    function buysVote(address payable _voteAddr) public payable notVoted(_voteAddr) forSale(_voteAddr) {
        Vote storage _vote = votes[_voteAddr];

        require(msg.value >= _vote.price, "Not enough funds transferred");
        
        uint change = msg.value - _vote.price;

        _voteAddr.transfer(_vote.price); 

        if (change > 0) {
            msg.sender.transfer(change); 
        }

        _vote.forSale = false;
        _vote.owner = msg.sender;
        emit VoteOwnershipChanged(_voteAddr, msg.sender);
    }
