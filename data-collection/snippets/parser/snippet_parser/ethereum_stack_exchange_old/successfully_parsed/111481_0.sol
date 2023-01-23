
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyTokenContract is ERC20 {
    address MyToken = 0x3114DbeAE60a6Ea05d04A8b361B261990b04606e;

    constructor() ERC20("masaToken", "MASASET") {
    }


    function total1() public view returns (uint256){
        return totalSupply();
    }


    function total2() public view returns (uint256){

        return ERC20(MyToken).totalSupply();
    }
}

