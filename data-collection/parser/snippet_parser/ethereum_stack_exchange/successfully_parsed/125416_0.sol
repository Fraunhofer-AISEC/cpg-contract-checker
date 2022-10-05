
    function releaseAll() external onlyOwner {
        for(uint i = 0; i < teamLength; i++) {
            release(payable(payee(i)));
        }
    }
