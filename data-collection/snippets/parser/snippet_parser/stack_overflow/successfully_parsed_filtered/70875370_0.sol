

pragma solidity >=0.7.0 <0.9.0;

import './DEXCoin.sol';

contract DEXUserCoin {

    struct UserCoin {
        uint coinId;
        uint256 amount; 
    }

    mapping(address => UserCoin) internal userCoins;

    constructor() {

    }

    function ApproveTransferSend(address userAddress , uint coinId , uint256 amount) external view returns(bool) {

        if(userCoins[userAddress].amount >= amount && userCoins[userAddress].coinId == coinId) {
            return true;
        } else {
            return false;
        } 

    }


}
