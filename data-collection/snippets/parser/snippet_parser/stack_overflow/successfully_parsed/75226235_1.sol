


import "./paymentManager.sol";
import "./NewsToken.sol";



pragma solidity ^0.8.17;

contract Web3News{
    address public writer;
    string public title;
    string public topics;
    string private subject;
    string private Autentic = "O artigo e verdadeiro";
    string private Fake = "O artigo e Falso";
    uint public minimumPayment;
    uint public itsAutentic;
    uint public itsFake;
    mapping(address => bool) public buyers;
  

    
    NewsToken public newsToken;
    


    event LogSecretAccess(address indexed sender);

    constructor(address _newsTokenAddr, string memory _title, string memory _topics, string memory _subject, uint _minimumPayment){
        writer = msg.sender;
        title = _title;
        topics = _topics;
        subject = _subject;
        minimumPayment = _minimumPayment;
        newsToken = NewsToken(_newsTokenAddr);
        
    }

    
    
        
      
        
        
        
       
       
        
    

    function getAccessToArticle1() public payable {
        require(newsToken.balanceOf(msg.sender) >= minimumPayment, "Not enough tokens");
        newsToken.approve(address(this), minimumPayment);
        
        newsToken.transferFrom(msg.sender, writer, minimumPayment);
        
        buyers[msg.sender] = true;
    }
    
    
      
        
        
        
        
        
    


    
    
    function readArticle() public returns (string memory) {
        
        require(buyers[msg.sender], "This address haven't purchased the article");
        emit LogSecretAccess(msg.sender);
        return subject;
    }

    
    function fakenews(bool _itsAutentic) public {
        require(buyers[msg.sender], "This address haven't purchased the article, so it can't vote");
        if (_itsAutentic) {
            itsAutentic = itsAutentic + 1;
        } else {
            itsFake = itsFake + 1;
        }
    }

    
    function judgement() public view returns (string memory) {
        
        require(newsToken.checkValidator(), "This address is not a validator");
        if (itsAutentic > itsFake) {
            return Autentic; 
        } else {
            return Fake;
        }
    }
    
    

}
