function withdraw() {
    if(msg.sender != a1 && msg.sender != a2 && msg.sender != a3) return;
    uint split = this.balance/3;

    if(msg.sender != a1) a1.send(split);
    if(msg.sender != a2) a2.send(split);
    if(msg.sender != a3) a3.send(split);

    
    msg.sender.send(split);
}
