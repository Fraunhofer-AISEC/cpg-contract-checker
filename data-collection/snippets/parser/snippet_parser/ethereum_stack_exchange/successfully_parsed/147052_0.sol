interface StableCoin {
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract AlgoToken is ERC20{

    using ABDKMathQuad for uint256;
    using ABDKMathQuad for int256;
    using ABDKMathQuad for bytes16;

    StableCoin public stable_coin;

    function buy(uint $USD_amount) public payable {
        
        

        stable_coin.transferFrom(msg.sender, address(this), $USD_amount);
        _mint(msg.sender, algos_to_mint);
    }

    function sell(uint $algo_amount) public payable{
    
       

       _burn(msg.sender, $algo_amount);
       stable_coin.transferFrom(address(this), msg.sender, $USD_to_send);
    }
}
