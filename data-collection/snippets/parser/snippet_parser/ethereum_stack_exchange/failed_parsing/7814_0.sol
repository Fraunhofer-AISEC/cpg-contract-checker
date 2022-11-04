  modifier contractOnly(){
    address contractAddress = this;
    if(msg.sender != contractAddress) throw; _
}
