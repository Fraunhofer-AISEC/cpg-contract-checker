function calculatePrice(uint8 decimalsA, uint256 priceForA, uint256 amountOfB) public {
return amountOfB * 10 ** decimalsA / priceForA;
}   

