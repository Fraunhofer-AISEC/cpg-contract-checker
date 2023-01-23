function calculateTax(int price) public returns(int) {
   emit TaxRequest(price);
   return price;
}
