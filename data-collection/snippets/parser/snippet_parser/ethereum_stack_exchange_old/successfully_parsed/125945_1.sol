

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/proxy/Proxy.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract TokenProxyR is ERC1967Proxy {
    uint32 private version;
    
    constructor(address _logic, bytes memory _data) ERC1967Proxy(_logic, _data) {}

    function versionProxy() public view returns(uint32) {
        return version;
    }

    function upgradeTo(address implementation) public {
        super._upgradeTo(implementation);
    }
}
