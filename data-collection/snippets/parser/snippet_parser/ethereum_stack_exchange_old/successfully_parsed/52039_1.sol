pragma solidity ^0.4.19;

import 'browser/MyCoin.sol';
import 'github.com/OpenZeppelin/zeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol';

contract MyCoinCrowdsale is MintedCrowdsale {
    function MyCoinCrowdsale
        (
            uint256 _rate,
            address _wallet,
            CappedToken _token
        )
        public
        Crowdsale(_rate, _wallet, _token) {

        }
}
