pragma solidity ^0.4.18;


 import "./Ownable.sol";


contract RentalContract is Ownable {

  struct Article{
  uint id;
  address seller;
  address buyer;
  uint beds;
  uint baths;
  string propaddress;
  uint256 rental_price;
  uint property_type;
  string description;
  bool available;
  string contact_email;
  }
  mapping(uint => Article) public articles;

  uint articleCounter;

event LogSellArticle(
uint indexed _id,
address indexed _seller,
  
  
string _propaddress,
uint256 _rental_price
  
  
  
  
  );
  event LogBuyArticle(
uint indexed _id,
address indexed _seller,
address indexed _buyer,
  
  
string _propaddress,
uint256 _rental_price
  
  
  
  

);

function kill() public onlyOwner {

selfdestruct(owner);
}

  function sellArticle(uint _beds, uint _baths, string _propaddress, uint256 _rental_price, uint _property_type, string _description, bool _available, string _contact_email) public {
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
 _available,
 _contact_email
 );

  
LogSellArticle(articleCounter, msg.sender, _propaddress, _rental_price);
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
   
LogBuyArticle(_id, article.seller, article.buyer, article.propaddress, article.rental_price);
 }
}
