contract Token is ERC20 {
    
    constructor(address _mainContract) ERC20('Token', 'TKN') {
        mainContract = _mainContract;
    }

    function payUser(address _user, uint256 _amount) external {
        require(msg.sender == mainContract);
        _mint(_user, _amount);
    }

}
```
