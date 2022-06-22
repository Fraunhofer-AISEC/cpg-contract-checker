function callFoo(A _addr) public view returns(bool) {

    uint256 csize;

    assembly {
        csize := extcodesize(_addr)
    }

    if (csize == 0) {
        return false;
    }

    try _addr.foo() returns(bool) {
        return true;
    } catch(bytes memory err) {
        return false;
    }
}
