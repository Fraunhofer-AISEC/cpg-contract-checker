function addToCart(uint256 _id) public {
    uint256 i = 0;
    for (i = 0; i <= customersCount; i++) {
        if (customers[i].owner == msg.sender) {
            customers[i].cartItems[customers[i].itemCount].push(
                CartItem(customers[i].itemCount, _id)
            );
            (customers[i].itemCount)++;
        }
    }
}
