function deposit() payable public {
    require(msg.value == 0.1 ether, "You need to send 0.1 Ether");
}
