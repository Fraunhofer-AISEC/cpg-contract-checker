 function triggerPayment(uint _Ind, uint qty, address buyer) public payable {
    ProductSale product = products[_Ind]._product;
    require(address(product) == msg.sender, "Only items are allowed to update themselves");
    
    paymentAuth[buyer]._transaction[paymentAuth[buyer]._buyerIndex]._itemStep = ItemSteps.Paid;
    products[_Ind]._quantity -= qty;
    paymentAuth[buyer]._transaction[paymentAuth[buyer]._buyerIndex]._quantity = qty;
    emit ItemStep(_Ind, buyer, paymentAuth[buyer]._buyerIndex, qty, uint( paymentAuth[buyer]._transaction[paymentAuth[buyer]._buyerIndex]._itemStep)); 
    emit ProductStep(_Ind, address(product),uint(products[_Ind]._quantity));
    paymentAuth[buyer]._buyerIndex++;
}
