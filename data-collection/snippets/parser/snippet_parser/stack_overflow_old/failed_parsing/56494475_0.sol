contract sendEther {
    function sendEther() payable {
        address to =  <Address2>;
        to.send(this.balance);
    }
}
