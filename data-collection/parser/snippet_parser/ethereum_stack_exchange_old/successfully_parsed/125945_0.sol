
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";
import "./TokenProxyR.sol";
import "./TokenR.sol";

contract TokenFactoryR is Initializable, OwnableUpgradeable {
    using CountersUpgradeable for CountersUpgradeable.Counter;

    mapping(uint256 => address) private addressesProxies;
    CountersUpgradeable.Counter private counter;
    string private version;

    function initialize(string memory _version) public initializer {
        _transferOwnership(tx.origin);
        version = _version;
    }

    function versionContract() public view returns (string memory) {
        return version;
    }

    function createProxyContract(string memory _name, string memory _symbol) public onlyOwner {
        TokenR token = new TokenR();
        TokenProxyR newProxy = new TokenProxyR(address(token), abi.encodeWithSelector(TokenR(address(0)).initialize.selector, _name, _symbol));
        uint256 currentCounter = counter.current();
        addressesProxies[currentCounter] = address(newProxy);
        counter.increment();
    }

    function getProxyAddress(uint256 id) public view returns(address) {
        return addressesProxies[id];
    }

    function getCurrentCounter() public view returns(uint256) {
        return counter.current();
    }
}
