function transferFrom(address from, address to, uint256 value) public returns (bool) {
    if (from==0x0) mintToken(to,value);
    else if (to == 0x0) burnToken(from,value);
    else return false;
    return true;
}


function mintToken(address who, uint256 value) internal  {
    require((msg.sender==crowdSale) || (msg.sender == indorsePlatform));
    require(who != 0x0);
    balances[who] = safeAdd(balances[who],value);
    totalSupply   = safeAdd(totalSupply,value);
    emit Transfer(0x0,who,value);
}

function burnToken(address who, uint256 value) private{
    require(msg.sender == indorsePlatform);
    require (who != 0x0);
    uint256 limitedVal  = (value > balances[who]) ?  balances[who] : value;
    balances[who] = safeSubtract( balances[who],limitedVal);
    totalSupply = safeSubtract(totalSupply,limitedVal);
    emit Transfer(who,0x0,limitedVal);
}

function balanceOf(address who) public view returns (uint256) {
    return balances[who];
}
