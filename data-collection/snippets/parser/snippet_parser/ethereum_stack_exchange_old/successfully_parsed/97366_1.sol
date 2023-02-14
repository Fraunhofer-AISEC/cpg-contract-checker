struct Dividend {
    mapping(address => bool) claimed;
    uint256 pool;
}
Dividend[] public dividends;

function createDividends() public {
    uint256 idx = dividends.length;
    dividends.push();
    Dividend storage d = dividends[idx];
    d.pool = 10;
    d.claimed[msg.sender] = true;
}
