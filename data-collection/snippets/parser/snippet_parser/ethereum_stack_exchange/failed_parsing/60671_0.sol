contract Shopping {

    struct Article {
        uint id; 
        address seller;
        address buyer;
        string name;
        string description;
        uint256 price;
    }

    
    mapping(uint256 => Article) public articles; 
    uint articleCounter;

    function buyArticle(uint _id ) public payable {
        Article  storage article = articles[_id];
        require( article.buyer == 0x0);                                      
        require(msg.sender != article .seller]);
    }
}
