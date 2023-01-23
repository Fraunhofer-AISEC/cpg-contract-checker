function pay() payable external {
    cur += 1;
    require(cur <= max);
    players[msg.sender] = true;
    playerKeys.push(msg.sender);
    if (cur == max){
        anotherFunction();
    }
}
