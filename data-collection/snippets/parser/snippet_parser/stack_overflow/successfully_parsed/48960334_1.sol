function requestForToken() public payable{
    address sender = msg.sender;
    uint value = msg.value;
    total_ether_to_send = value / 2;
    require(this.balance >= total_ether_to_send);
    owner.transfer(total_ether_to_send);

    require(this.balance >= total_ether_to_send);
    sender.transfer(total_ether_to_send);
} 

function() payable {}
