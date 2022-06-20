pragma solidity ^0.4.18;

 import "./Ownable.sol";


contract RentalContractTesting is Ownable {

  struct Article{
  uint id;
  address seller;
  address buyer;
  uint8 beds;
  uint8 baths;
  string propaddress;
  uint rental_price;
  string property_type;
  string description;
  string contact;
  }
  mapping(uint => Article) public articles;

  struct Article2{
  uint id;
  address seller;
  address buyer;
  string available;
  }

  mapping(uint => Article2) public articles2;
  uint articleCounter;

    event LogSellArticle(
    uint indexed _id,
    address indexed _seller,
    uint8 _beds,
    uint8 _baths,
    string _propaddress,
    uint _rental_price,
    string _property_type,
    string _description,
    string _contact
    );
    event LogSellArticle2(
    string _available
    );

  event LogBuyArticle(
    uint indexed _id,
    address indexed _seller,
    address indexed _buyer,
    uint8 _beds,
    uint8 _baths,
    string _propaddress,
    uint _rental_price,
    string _property_type,
    string _description,
    string _contact
    );
  event LogBuyArticle2(
    uint indexed _id,
    address indexed _seller,
    address indexed _buyer,
    string _available
);
function kill() public onlyOwner {

selfdestruct(owner);
}



  function sellArticle(uint8 _beds, uint8 _baths, string _propaddress, uint _rental_price, string _property_type, string _description, string _contact) public {
    articleCounter++;

    articles[articleCounter] = Article(
      articleCounter,
     msg.sender,
     0x0,
     _beds,
     _baths,
     _propaddress,
     _rental_price,
     _property_type,
     _description,
     _contact
);
LogSellArticle(articleCounter, msg.sender, _beds, _baths, _propaddress, _rental_price, _property_type, _description, _contact);
}

  function getNumberOfArticles() public view returns (uint){
  return articleCounter;
}

function getArticlesForSale() public view returns (uint[]){

  uint[] memory articleIds = new uint[](articleCounter);

  uint numberOfArticlesForSale = 0;

  for(uint i = 1; i <= articleCounter; i++){
    if(articles[i].buyer == 0x0){
      articleIds[numberOfArticlesForSale] = articles[i].id;
      numberOfArticlesForSale++;
    }
  }
    uint[] memory forSale = new uint[](numberOfArticlesForSale);
    for(uint j = 0; j < numberOfArticlesForSale; j++){
    forSale[j] = articleIds[j];
    }
    return forSale;
    }

     function sellArticle2(string _available) public {
       articleCounter++;

     articles2[articleCounter] = Article2(
     articleCounter,
     msg.sender,
     0x0,
     _available
    );

      LogSellArticle2(_available);
}
       function getArticlesForSale2() public view returns (uint[]){

         uint[] memory articleIds = new uint[](articleCounter);
         uint numberOfArticlesForSale2 = 0;

      for(uint i = 1; i <= articleCounter; i++){
     if(articles2[i].buyer == 0x0){
       articleIds[numberOfArticlesForSale2] = articles2[i].id;
     numberOfArticlesForSale2++;
      }
  }

     uint[] memory forSale = new uint[](numberOfArticlesForSale2);
     for(uint j = 0; j < numberOfArticlesForSale2; j++){
     forSale[j] = articleIds[j];
     }
     return forSale;
   }


 function buyArticle(uint _id) payable public {

   require(articleCounter > 0);
   require(_id > 0 && _id <= articleCounter);

   Article storage article = articles[_id];

   require(article.buyer == 0x0);

   require(msg.sender != article.seller);

   require(msg.value == article.rental_price);

   article.buyer = msg.sender;

   article.seller.transfer(msg.value);
   
    LogBuyArticle(_id, article.seller, article.buyer, article.beds, article.baths, article.propaddress, article.rental_price, article.property_type, article.description, article.contact);
 }
 function buyArticle2(uint _id) payable public {

   require(articleCounter > 0);
   require(_id > 0 && _id <= articleCounter);

   Article2 storage article2 = articles2[_id];

   require(article2.buyer == 0x0);

   require(msg.sender != article2.seller);

   

   article2.buyer = msg.sender;

   article2.seller.transfer(msg.value);

    LogBuyArticle2(_id, article2.seller, article2.buyer, article2.available);
 }
}
