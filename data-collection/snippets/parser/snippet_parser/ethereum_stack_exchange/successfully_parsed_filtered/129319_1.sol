
address[] public addressArray;

function distribute() public {
    uint256 arrayLength = addressArray.length;
    uint256 amountToPay = address(this).balance/arrayLength;
    uint256 i;
    for(i =0; i<arrayLength -1; i++ ){
        payable(addressArray[i]).transfer(amountToPay);
    }
    payable(addressArray[arrayLength-1]).transfer(address(this).balance);
}
