

pragma solidity ^0.8.0;

import "./SafeERC20.sol";


contract TokenTimelock {
    using SafeERC20 for IERC20;

    
    IERC20 immutable private _token;

    
    address immutable private _beneficiary;

    
    uint256 immutable private _releaseTime;

    constructor (IERC20 token_, address beneficiary_, uint256 releaseTime_) {
        
        require(releaseTime_ > block.timestamp, "TokenTimelock: release time is before current time");
        _token = token_;
        _beneficiary = beneficiary_;
        _releaseTime = releaseTime_;
    }

    
    function token() public view virtual returns (IERC20) {
        return _token;
    }

    
    function beneficiary() public view virtual returns (address) {
        return _beneficiary;
    }

    
    function releaseTime() public view virtual returns (uint256) {
        return _releaseTime;
    }

    
    function release() public virtual {
        
        require(block.timestamp >= releaseTime(), "TokenTimelock: current time is before release time");

        uint256 amount = token().balanceOf(address(this));
        require(amount > 0, "TokenTimelock: no tokens to release");

        token().safeTransfer(beneficiary(), amount);
    }
}
