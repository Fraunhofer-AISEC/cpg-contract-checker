contract TipFaucet {

    uint public received;
    uint public paid;

    modifier isDev { if (msg.sender != 

    function withdraw() isDev {
        paid += this.balance;
        msg.sender.send(this.balance);
    }

    function () {
        received += msg.value;
    }
}
