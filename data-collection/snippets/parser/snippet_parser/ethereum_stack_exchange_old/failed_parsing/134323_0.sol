contract Bank {

    event Donation(address indexed _address, uint amount);

    receive() external payable { emit Donation(msg.sender, msg.value); }
    fallback() external payable { emit Donation(msg.sender, msg.value); }

...

    

}
