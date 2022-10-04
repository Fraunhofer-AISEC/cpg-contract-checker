contract testContract {
    function isStringEmpty(string memory _test) public view returns(bool) {
        bytes memory checkString = bytes(_test);
        if (checkString.length > 0) {
            return false;
        } else {
            return true;
        }
    }
}
