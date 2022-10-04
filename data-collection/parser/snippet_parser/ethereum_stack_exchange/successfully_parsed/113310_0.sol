contract Experiment is ERC20, ERC20Burnable, Ownable, usingProvable  {
uint public etherUSD;

  constructor() ERC20("Experiment", "EXT") public {
    etherUSD = 0;
}

function mint_callback(
address to, 
uint256 amount,
string memory result, 
bytes32 myid) 
public payable onlyOwner 

{
    provable_query("URL", "json(https://api.coingecko.com/api/v3/simple/price?ids=DAI&vs_currencies=USD).price"); 
    etherUSD = parseInt(result, 2); 
    require(msg.sender == provable_cbAddress());
    _mint(to, amount); 
}
}