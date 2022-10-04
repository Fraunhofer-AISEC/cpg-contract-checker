contract TipFaucet {

    modifier isDev { if (msg.sender != 

    function withdraw() isDev {
        msg.sender.send(this.balance);
    }
}
