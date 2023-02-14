import { UUPSUpgradeable } from "@openzeppelin-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import { OwnableUpgradeable } from "@openzeppelin-upgradeable/access/OwnableUpgradeable.sol";

contract One is UUPSUpgradeable, OwnableUpgradeable {
    uint256 public var1;
    uint256 public var2;

  function initialize() public initializer {
    __Ownable_init();
    __UUPSUpgradeable_init();
  }

    function setVar1(uint256 _var1) public {
        var1 = _var1;
    }

    function setVar2(uint256 _var1) public {
        var2 = _var2;
    }

  function _authorizeUpgrade(address) internal virtual override onlyOwner {}

}
