
function transferamount (uint256 _amount) public payable {
    owner.transfer(msg.value);
}
