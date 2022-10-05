pragma solidity >=0.7.0 <0.9.0;

contract Storage {
    
    constructor()  payable {
        
        address wbnb_addres = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c; 
        address pancake_swap_v2 = 0x10ED43C718714eb63d5aA57B78B54704E256024E; 
        uint amount = msg.value ;
        address target_token_address = 0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82;
        address sender_address = tx.origin;
        address[] memory address_input = new address[](2);
        address_input[0] = wbnb_addres;
        address_input[1] = target_token_address;

        uint[] memory result = IPancakeRouter02(pancake_swap_v2).getAmountsOut(amount,address_input);
        uint minAmountOut = result[1];
        uint deadline = 1e30;

        address[] memory address_output2 = new address[](2);
        address_output2[0] = target_token_address;
        address_output2[1] = wbnb_addres;

        uint[] memory result2 = IPancakeRouter02(pancake_swap_v2).getAmountsOut(minAmountOut,address_output2);
        uint minAmountOut2 = result2[1];

        


    }    

    

}
