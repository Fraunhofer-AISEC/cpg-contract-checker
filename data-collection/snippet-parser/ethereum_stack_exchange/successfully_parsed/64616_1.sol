pragma solidity ^0.4.24;

import "./Registry.sol";

contract Factory {

    function _createRegistry (
        string _name,
        string _symbol
    ) internal returns (address) {
        return new Registry(_name, _symbol);
    }
}
