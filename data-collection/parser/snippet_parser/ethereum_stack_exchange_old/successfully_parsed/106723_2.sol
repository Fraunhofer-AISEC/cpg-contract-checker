
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC1155/presets/ERC1155PresetMinterPauserUpgradeable.sol";

contract Test is ERC1155PresetMinterPauserUpgradeable {
    string private _uri;

    event upgradeEvent(string);

    function uri(uint256) public view virtual override returns (string memory) {
        return string(abi.encodePacked(_uri, "/new"));
    }

    function seturi(string memory uri) public {
        emit upgradeEvent("this is an upgraded contract");
        _uri = uri;
    }
}
