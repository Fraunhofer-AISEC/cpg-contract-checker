int min_required = 50; 
int _price = getThePrice() / 10 ** 8; 

require(msg.value >= min_required / _price, "NOT ENOUGH ETHER");
