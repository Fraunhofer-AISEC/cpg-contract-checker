function allowedNumberOfTimes(address a) public view returns (uint res) {
    uint b = getERC20Balance(a);

    if(b > 1000) res = 3;
    else if(b > 500) res = 2;
    else res = 1;
}
