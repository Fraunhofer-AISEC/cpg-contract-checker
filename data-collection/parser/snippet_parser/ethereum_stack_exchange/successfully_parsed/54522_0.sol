contract A {
    function verifyUser(address userAddress) public returns(bool) {
        bool verified = false;
        uint id = userId[userAddress];
        if (id != 0) {
            verified = true;
        }
        return verified;
    }
}
