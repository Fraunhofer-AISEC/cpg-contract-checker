pragma solidity ^0.4.24;

import "../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../node_modules/openzeppelin-solidity/contracts/lifecycle/Pausable.sol";

contract EtherBandBattlesManager is Pausable {

using SafeMath for uint256;    

    function testPayment(address _payeeAddr)
            payable
            public
            onlyOwner
            {
        require(_payeeAddr != address(0), "(testPayment) The payee address is not set.");
        require(msg.value != 0, "(testPayment) The amount of value accompanying the transaction is zero.");

        
        _payeeAddr.transfer(msg.value);
    }
}
