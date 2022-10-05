function _check() internal view returns(bool success) {
    for (uint i = 0; i < registered.length - 1; i++) {
        if(registered[i] == msg.sender) {
            return true;
        }
    }
    return false;
 }
