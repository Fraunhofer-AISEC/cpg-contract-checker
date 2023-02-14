pragma solidity 0.8.15;

import "./GenericERC721.sol";
import "./cloneFactory.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract GenericFactory is Ownable, CloneFactory {
    address public proxyAddress;
    address public logicAddress;

    address[] public addressBook;

    event GenericERC721created(address deployedProxyAddress);

    constructor(address _proxyAddress, address _logicAddress) {
        proxyAddress = _proxyAddress;
        logicAddress =_logicAddress;
    }

    function createProxy(
        address _owner,
        string calldata _name,
        string calldata _symbol
    ) public onlyOwner {

        address clone = createClone(proxyAddress);
        ERC1967Proxy(clone).constructor(logicAddress, abi.encodeWithSignature("initialize(address,string,string)", _owner, _name, _symbol));
        addressBook.push(clone);
        emit GenericERC721created(clone);
    }
}
