if (h > 0) {
    uint value = h * 1 ether;
    require(value / h == 1 ether, "multiplication overflow");
    p.transfer(value);
}
