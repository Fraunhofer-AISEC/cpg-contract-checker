function isPayable(address testAddress) private returns (bool) {
    if(payable(testAddress).send(0)) {
        return true;
        }
    return false;
    }
