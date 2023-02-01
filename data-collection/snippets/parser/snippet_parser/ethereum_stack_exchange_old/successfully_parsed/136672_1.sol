
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract Uniswap {
    address private constant uniswap_goerli = '0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f';
    address private constant WETH_Goerli = '0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6';
    address private constant ETH_Goerli = '0x7af963cF6D228E564e2A0aA0DdBF06210B38615D';

    function swap_token(uint _amount_to_send) public {
       
        IERC20(ETH_Goerli).transferFrom(msg.sender, address(this),_amount_to_send);
        IERC20(ETH_Goerli).approve(uniswap_goerli,_amount_to_send);


    }
    function get_balance() public view returns(uint) { 
        return address(this).balance;
    }


}