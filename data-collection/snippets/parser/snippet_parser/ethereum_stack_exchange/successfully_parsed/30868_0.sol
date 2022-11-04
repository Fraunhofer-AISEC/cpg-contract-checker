function buyToken() payable returns (bool) {
    require(tokens[owner] >= 1 && msg.value >= price);

    
    owner.transfer(msg.value.sub(price));

    tokens[owner] = tokens[owner].sub(1);
    tokens[msg.sender] = tokens[msg.sender].add(1);

    return true;
}
