pragma solidity ^0.4.18;


 import "./Ownable.sol";


contract OurRentalTestFromClassMay24 is Ownable {

  struct Article{
  uint id;
  address seller;
  address buyer;
  uint beds;
  uint baths;
  string propaddress;
  uint rental_price;
  string article_description;
  string available;
  string contact_email;
  }
  mapping(uint => Article) public articles;

  uint articleCounter;

    event LogSellArticle(
    address indexed _seller,
    uint _beds,
    uint _baths,
    string _propaddress,
    uint _rental_price,
    string _article_description,
    string _available,
    string _contact_email
  );
  event LogBuyArticle(
    uint indexed _id,
    address indexed _seller,
    address indexed _buyer,
    uint _beds,
    uint _baths,
    string _propaddress,
    uint _rental_price,
    string _article_description,
    string _available,
    string _contact_email

    );

    function kill() public onlyOwner {

    selfdestruct(owner);
    }

  function sellArticle(uint _beds, uint _baths, string _propaddress, uint _rental_price, string _article_description, string _available, string _contact_email) public {
    articleCounter++;

    articles[articleCounter] = Article(
      articleCounter,
     msg.sender,
    0x0,
     _beds,
     _baths,
     _propaddress,
     _rental_price,
     _article_description,
     _available,
     _contact_email
     );

    LogSellArticle(msg.sender, _beds, _baths, _propaddress, _rental_price, _article_description, _available, _contact_email);
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


 function buyArticle(uint _id) payable public {

   require(articleCounter > 0);
   require(_id > 0 && _id <= articleCounter);

   Article storage article = articles[_id];

   require(article.buyer == 0x0);

   require(msg.sender != article.seller);

   require(msg.value == article.rental_price);

   article.buyer = msg.sender;

   article.seller.transfer(msg.value);
   LogBuyArticle(_id, article.seller, article.buyer, article.beds, article.baths, article.propaddress, article.rental_price, article.article_description, article.available, article.contact_email);
 }
}
