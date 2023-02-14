function deposit(uint amount) payable public {
    require(msg.value == amount);
}
