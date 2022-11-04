

pragma solidity >=0.7.0 <=0.9.0;

contract MFC {
    address payable owner;
    uint public minPrice = 1 ether;
    uint public _minPrice = minPrice + 1 ether;
    uint public cur_Price;
    uint public category_Price;
    string public categoryName;
    uint public p = 1 ether;
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
        p = p + msg.value;
 


    
    if (keccak256(abi.encodePacked(_categoryName)) != keccak256(abi.encodePacked(cPr[categoryName]))) {
        require(msg.value >= minPrice );
            } else if (keccak256(abi.encodePacked(_categoryName)) == keccak256(abi.encodePacked(cPr[categoryName]))){
                require(msg.value > p);
    }

    
     


     messages.push(
            Message({
                id : messageId, 
                username : msg.sender, 
                categoryName : _categoryName, 
                messageText : _messageText, 
                isDeleted : _isDeleted, 
                curPrice : cur_Price,
                categoryPrice : cur_Price
                })
        );


        cPr[_categoryName] = msg.value;
        emit AddMessage(msg.sender, messageId);

    }

    function getInfo(uint _messageId) public view returns (Message memory) {
        require(_messageId < messages.length);
        return messages[_messageId];
    }
}
