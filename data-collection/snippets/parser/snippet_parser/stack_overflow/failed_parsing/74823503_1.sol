pragma solidity ^0.6.0;

import "https://github.com/aave/aave-solidity/contracts/AAVE.sol";
import "https://github.com/Uniswap/uniswap-v2-core/contracts/interfaces/IUniswapV2Pair.sol";
import "https://github.com/sushiswap/sushiswap-v2-core/contracts/interfaces/ISushiV2Pair.sol";


address private wallet = 0x0000000000000000000000000;


address private aave = 0x7deB5e830be29F91E298ba5FF1356BB7fC8B8C9D; 
address private uniswap = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f; 
address private sushiswap = 0x6b3595068778dd592e39a122f4f5a5cf09c90fe2; 


address private eth = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE; 
address private ape = 0x27Dce1e12396F3a2B49E4FdD7a4C9d938E5e5F97; 


AAVE aaveContract;
IUniswapV2Pair uniswapContract;
ISushiV2Pair sushiswapContract;

constructor() public {
    aaveContract = AAVE(aave);
    uniswapContract = IUniswapV2Pair(uniswap);
    sushiswapContract = ISushiV2Pair(sushiswap);
}


function borrowFromAAVE() public {
    aaveContract.borrow(eth, 100 ether, wallet);
}


function swapETHtoAPEonSushiSwap(uint amount) public {
    sushiswapContract.swap(amount ether, 10**18, ape, wallet, address(this));
}


function swapETHtoAPEonUniswap(uint amount) public {
    uniswapContract.swapETHForExactTokens(amount ether, 10**18, ape, wallet, address(this));
}


function swapAPEtoETHonSushiSwap(uint amount) public {
    sushiswapContract.swap(amount, 10**18, eth, wallet, address(this));
}


function payBackLoanToAAVE() public {
    
    require(wallet.balance >= aaveContract.borrowBalance(eth, wallet), "Insufficient balance to pay back the loan.");

    
    aaveContract.repayBorrow(eth, wallet);
}


function keepProfitInWallet(uint amount) public {
    
    require(address(this).balance >= amount, "Insufficient balance in the contract.");

    
    wallet.transfer(amount);
}

