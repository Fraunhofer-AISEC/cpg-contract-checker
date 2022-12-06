contract someContract {
  address author = "0x00...";
  mapping (address => uint) public sentToAuthor;
  function sendToAuthor () public payable {
    sentToAuthor[msg.sender] = msg.value;
    author.call{value: msg.value}("");
  }
}
