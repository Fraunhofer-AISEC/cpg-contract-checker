contract Test {

    function Test() {
        owner = msg.sender;
    }

    function pay(uint _price) payable returns (bool) {
        

        require(_price == msg.value); 
        address(this).transfer(msg.value); 
        balanceOfContract[address(this)] += msg.value; 

        LogDeposit(msg.sender, msg.value);

        return true;
    }
}
