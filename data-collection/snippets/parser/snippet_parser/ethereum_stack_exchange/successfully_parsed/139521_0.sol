function buy(address _investor, uint256 amount)
        public
        onlyOwner
        returns (bool)
    {
        require(investorApproved[_investor] == true, "Investor not allowed");
        address owner = address(this);
        _approveContract(_investor);
        _transfer(owner, _investor, amount);
        return true;
    }

