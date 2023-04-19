`function to calculate the current price of a listed token based on the available orders in     the order book
function getPrice(address token) public view returns (uint256) {
require(tokens\[token\], "Token is not listed");
uint256 totalAmount = 0;
uint256 totalPrice = 0;
for (address user in orderBook\[token\]) {
totalAmount = totalAmount.add(orderBook\[token\]\[user\]);
totalPrice = totalPrice.add(orderPrices\[token\]\[user\].mul(orderBook\[token\]\[user\]));
}
return totalPrice.div(totalAmount);
}`

