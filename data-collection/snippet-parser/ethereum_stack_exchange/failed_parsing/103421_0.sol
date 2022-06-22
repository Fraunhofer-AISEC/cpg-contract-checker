    modifier onlyUsers {
        require(_users[msg.sender] || msg.sender == _owner, "Not Allowed");
        _;
     }

    function withdrawTokensFromContract(address _token, uint256 _amount) public onlyUsers returns (bool) {
        uint256 balance = getTokenBalance(_token);
        require(balance >= _amount, 'Amount exceeds Balance');
        IBEP20(_token).transfer(msg.sender, _amount);
    }
