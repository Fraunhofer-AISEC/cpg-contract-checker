    

pragma solidity >=0.7.0 <=0.9.0;

contract MFC {
    address payable owner;
    uint public minPrice = 1 ether;
    uint public cur_Price;
    string public categoryName;
    uint public category_Price;
    
    constructor () {
        owner = payable(msg.sender);
    }    

    event AddMessage        (address recipient, uint messageId);
    event DeleteMessage     (uint tweetId, bool isDeleted);

    struct Message {
        uint id;
        address username;
        string categoryName;
        string messageText;
        bool isDeleted;
        uint curPrice;
        uint categoryPrice;
    } 

    Message[] private messages;

    mapping(uint256 => Message) messageToOwner;
    mapping(string => Message) categoryMessages;

    function addMessage(string memory _categoryName, string memory _messageText, bool _isDeleted) external payable{

        require(msg.value > (minPrice + cur_Price) - 1); 
        cur_Price = msg.value;
        uint messageId = messages.length;

        categoryName = _categoryName;
        messages.push(
            Message({
                id : messageId, 
                username : msg.sender, 
                categoryName : _categoryName, 
                messageText : _messageText, 
                isDeleted : _isDeleted, 
                curPrice : cur_Price,
                categoryPrice : category_Price
                })
                );

        emit AddMessage(msg.sender, messageId);
    }


    function getInfo(uint _messageId) public view returns (Message memory) {
        require(_messageId < messages.length);
        return messages[_messageId];
    }
}
