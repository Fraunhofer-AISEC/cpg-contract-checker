function payToSave(bytes32 data) public return(bool){
    balance[msg.sender] = balance[msg.sender].sub(20); 
    balance[owner] = balance[owner].add(20);
    register[msg.sender] = data;
    emit Transfer(msg.sender,owner,20)
    return true;
}
