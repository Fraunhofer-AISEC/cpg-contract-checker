
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface ISPCT is IERC20 {
    function increaseAllowance(address, uint256) external virtual returns (bool);
}


contract canAllow {
    ISPCT public spctContract;
    address public SPCTaddress;

    constructor(address _SPCT) {
        SPCTaddress = _SPCT;
        spctContract = ISPCT(SPCTaddress);
    }

    function setAllowance(uint256 _amount){
        bool increasedAllowance = spctContract.increaseAllowance(msg.sender, _amount);
        require(increasedAllowance, "no_allowance");
    }
}
