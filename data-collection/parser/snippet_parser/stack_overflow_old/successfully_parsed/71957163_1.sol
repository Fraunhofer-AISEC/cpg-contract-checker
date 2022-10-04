
mapping(address => mapping (address => uint256)) rates;

function setRating(address memory token1, address memory token2, uint256 rate) public {
     rates[token1][token2] = rate;
}
