import "@openzeppelin/contracts/presets/ERC20PresetMinterPauser.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./UsingLiquidityProtectionService.sol";

contract SporesToken is
    UsingLiquidityProtectionService(0xBA2bF7693E0903B373077ace7b002Bd925913df2),
    ERC20PresetMinterPauser,
    Ownable
