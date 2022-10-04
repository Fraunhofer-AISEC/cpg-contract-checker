import "./TypesLib.sol";
import { DefaultLib as Default } from "./DefaultLib.sol";
import { CustomLib as Customized } from "./CustomizedLib.sol";



library CustomLib {
    TypesLib.TokenStorage token;

    function transfer(address to, uint256 amount) public returns (bool success) {
        return Customized.transfer(token, to, amount);
    }
}
