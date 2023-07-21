 constructor(uint256 amount) ERC20("BCToken", "BCT") public {}

function mint(address user, uint amount) 
    external 
    onlyAdmin 
    returns(bool)
{
    _mint(user, amount);
    return true;
}