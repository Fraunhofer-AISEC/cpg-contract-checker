interface pancackswap_interface {

    
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
    external view returns (uint[] memory amounts); 
}

contract my_contract {
    
    address pancack_swap_contract = 0x10ED43C718714eb63d5aA57B78B54704E256024E;

    
    pancackswap_interface use_pancake = pancackswap_interface(pancack_swap_contract);

        
    function view_token_for_eth_swap(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline) public view returns(uint[] memory amounts) {
            return use_pancake.swapExactTokensForETH(amountIn, amountOutMin, path, to, deadline);
    }
}
