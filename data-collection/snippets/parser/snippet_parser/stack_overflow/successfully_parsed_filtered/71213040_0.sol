

bool sent = payable(owner()).send(tokenPrice);

require(sent, "failed to send ether");

if (msg.value - tokenPrice > 0) {

payable(msg.sender).transfer(msg.value - tokenPrice);

}
