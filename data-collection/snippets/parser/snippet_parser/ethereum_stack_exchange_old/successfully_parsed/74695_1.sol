bytes32[] garbage;

function pay() payable external {
    cur += 1;
    require(cur <= max);
    players[msg.sender] = true;
    playerKeys.push(msg.sender);
    if (cur == max){
        
        
        garbage.length = 0;
        anotherFunction();
    } else {
        garbage.push(0x01); 
    }
}
