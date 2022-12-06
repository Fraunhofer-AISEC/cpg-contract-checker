function calculateReputation(string memory sender_string) public payable returns
(uint) {
address _sender = parseAddr(sender_string);
if (totalShipped[_sender] != 0) {
return (100 * successShipped[_sender] / totalShipped[_sender]);
}
else {
return 0;
}
}
