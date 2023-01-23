
function sellAsset(int price) public {
    int tax = TaxContract(contractAddress).calculateTax(price);
}
