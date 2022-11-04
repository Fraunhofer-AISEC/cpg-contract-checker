address payable admin;

function endSale() public {
    require(msg.sender == admin, "must be admin");
    require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));
    selfdestruct(admin);
}
