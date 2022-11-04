import { UUPSUpgradeable } from "@openzeppelin-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import { OwnableUpgradeable } from "@openzeppelin-upgradeable/access/OwnableUpgradeable.sol";

contract Utils is UUPSUpgradeable, OwnableUpgradeable {
    uint256 public var2;

  function initialize() public initializer {
    __Ownable_init();
    __UUPSUpgradeable_init();
  }

    function setVar2(uint256 _var2) public {
        var2 = _var2;
    }

  function _authorizeUpgrade(address) internal virtual override onlyOwner {}

}
