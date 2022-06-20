struct Article {
    address seller;
    uint bid;
    uint bidder;    
}

Article[] articles;

function getArticle(uint _id) returns(address seller, uint bid, uint bidder){
    return(articles[_id].seller,articles[_id].bid,articles[_id].bidder);
}

function getArticlesAmount() returns(uint amount) {
    return articles.length;
}
