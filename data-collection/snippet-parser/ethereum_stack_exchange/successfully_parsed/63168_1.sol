contract ERC20Mintable is ERC20, MinterRole {

function mint(
address to,
uint256 value
)
public
onlyMinter
returns (bool)
{
_mint(to, value);
return true;
}
}
