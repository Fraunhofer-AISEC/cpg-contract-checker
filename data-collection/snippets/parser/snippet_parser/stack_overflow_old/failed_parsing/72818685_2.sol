
struct BuyParams {
        bytes4 buySigHash;
        uint256 productAmount;
        bytes3 color;
}


BuyParams memory decoded = abi.decode(
    data,
    (BuyParams)
);



decoded.buySigHash,
decoded.productAmount,
decoded.color,


