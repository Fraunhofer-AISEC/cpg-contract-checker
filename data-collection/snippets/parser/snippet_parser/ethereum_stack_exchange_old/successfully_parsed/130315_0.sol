



pragma solidity >=0.4.16 <0.9.0;

import "@openzeppelin/contracts/metatx/ERC2771Context.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Storage is ERC2771Context, Ownable {
    uint storedData;

    event ValueInitialized(
        uint initValue,
        address initializer
    );

    event ValueModified(
        uint oldValue,
        uint newValue,
        address changer
    );

    constructor(uint initValue, address trustedForwarder) ERC2771Context(trustedForwarder) {
        
        storedData = initValue;
    }

    function _msgSender() internal view virtual override(ERC2771Context, Context) returns (address sender) {
        return super._msgSender();
    }

    function _msgData() internal view virtual override(ERC2771Context, Context) returns (bytes calldata) {
        return super._msgData();
    }

    function set(uint newValue) public {
        emit ValueModified(storedData, newValue, _msgSender());
        storedData = newValue;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}
