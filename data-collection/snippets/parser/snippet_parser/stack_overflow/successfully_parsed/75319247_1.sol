
pragma solidity 0.8.8;
contract Giftcard{
    event UniqueCardId(uint indexed Id,address indexed owner);
    
    
    
    address[]  Giftcardowners;
    mapping(address => uint) amountUploaded;
    function Addamount() external payable{
        require(msg.value >= 1 ether,"Gift card amount to small");
        amountUploaded[msg.sender] = msg.value;
        Giftcardowners.push(msg.sender);
        emit UniqueCardId(Giftcardowners.length-1,msg.sender);
    }
    function GetGiftcard(uint _cardId) payable external {
        require(Giftcardowners.length > _cardId,"Id doesnot exits");
        address owner = Giftcardowners[_cardId-1];
        uint amount = amountUploaded[owner];
        require(amount >= 1 ether,"transfered is less than 1 ether");
       
        
        payable(msg.sender).transfer(1 ether);
    }
    function getBalance() external view  returns(uint balance){
        return address(this).balance;
    }
}
