function withdrawAll() public payable onlyOwner {
    uint256 _each = address(this).balance / 4;
    require(payable(t1).send(_each), "Account is being paid out");
    require(payable(t2).send(_each), "Account is being paid out");
    require(payable(t3).send(_each), "Account is being paid out");
    require(payable(t4).send(_each), "Account is being paid out");
}
