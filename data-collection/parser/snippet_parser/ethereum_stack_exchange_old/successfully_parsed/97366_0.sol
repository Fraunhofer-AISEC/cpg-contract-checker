struct Dividend {
    mapping(address => bool) claimed;
    uint256 pool;
}
Dividend[] public dividends;

function createDividends() public {
    Dividend storage d;
    d.pool = dividendPool;
    dividends.push(d);
}
