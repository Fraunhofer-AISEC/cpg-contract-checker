function token(uint256 initialsupply, string symbol, string name, uint256 
buyPrice, uint256 sellPrice) public {

    totalSupply = initialsupply * 10**decimals;
    tokenBalance[msg.sender] = totalSupply;
    tokenSymbol = symbol;
    tokenName = name;
    buyprice = buyPrice;
    sellprice = sellPrice;
    require(buyprice <= sellprice);
    owner = msg.sender; 
