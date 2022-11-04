uint256 public count;

function () external payable {
    require(count < 2);
    count++;
}
