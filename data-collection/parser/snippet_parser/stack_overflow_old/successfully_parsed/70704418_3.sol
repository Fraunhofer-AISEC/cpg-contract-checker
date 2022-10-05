address constant BUSD = 0xDAcbdeCc2992a63390d108e8507B98c7E2B5584a;
address constant WBNB = 0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd;

function getPathForWBNBtoDAI() public view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = WBNB;
    path[1] = BUSD;

    return path;
}
