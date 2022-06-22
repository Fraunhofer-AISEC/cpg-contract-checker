    
contract Auction {
    address currentLeader;
    uint highestBid;

    function bid() payable {
        require(msg.value > highestBid);

        require(currentLeader.send(highestBid)); 

        currentLeader = msg.sender;
        highestBid = msg.value;
    }}
