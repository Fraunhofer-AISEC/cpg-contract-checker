

pragma solidity >=0.7.0 <=0.9.0;

contract MFC {
    address payable owner;
    uint public minPrice = 1 ether;
    uint public cur_Price;
    uint public category_Price;
    string public categoryName;
    uint public curPrice1 = 1;
    uint public curPrice2 = 2; 
    
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

    Message[] public messages;

    mapping(uint256 => Message) messageToOwner;
    mapping(string => uint) cPr;
    

    function getCpr (string memory category) public view returns (uint) {
        return cPr[category];
    }

    function addMessage(string memory _categoryName, string memory _messageText, bool _isDeleted) external payable {
        
        cur_Price = msg.value;
        categoryName = _categoryName;
        uint messageId = messages.length;


if (keccak256(abi.encodePacked(_categoryName)) != keccak256(abi.encodePacked(categoryName))) {
    require(msg.value == curPrice1);
    curPrice1 = curPrice1 * 2;
} else if (keccak256(abi.encodePacked(_categoryName)) == keccak256(abi.encodePacked(categoryName))){
    require(msg.value == curPrice2);
    curPrice2 = curPrice2 * 3;
}
          
        messages.push(
            Message({
                id : messageId, 
                username : msg.sender, 
                categoryName : _categoryName, 
                messageText : _messageText, 
                isDeleted : _isDeleted, 
                curPrice : cur_Price,
                categoryPrice : msg.value
                })
        );




        emit AddMessage(msg.sender, messageId);

    }

    function getInfo(uint _messageId) public view returns (Message memory) {
        require(_messageId < messages.length);
        return messages[_messageId];
    }
}
