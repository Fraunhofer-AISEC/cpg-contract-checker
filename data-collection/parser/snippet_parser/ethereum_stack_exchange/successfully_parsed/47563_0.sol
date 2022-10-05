function createOrder() public {
    creationTime = now;
}

function orderStatus() view returns (OrderStatus) {
    if (now < creationTime + 30 days) {
        return OrderStatus.InProgress;
    } else {
        return OrderStatus.Finished;
    }
}
