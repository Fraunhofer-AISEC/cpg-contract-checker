mapping (address => uint256) private _buyBlock; 

function _transfer(address from, address to, uint256 amount) 
...
    require(_buyBlock[from] != block.number, "Bad bot!");
...
    _buyBlock[to] = block.number;
