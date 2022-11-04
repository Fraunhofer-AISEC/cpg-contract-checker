
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract NFTPomoBots is ERC1155, Ownable {
    IERC20 private _roboToken;

    constructor(IERC20 roboToken)
        ERC1155(
            "ipfs://QmcPjTnt33BRM5TPGyno7restoftheurl/({id}.json"
        )
    {
        _roboToken = roboToken;
    }

    function mintPomoBot(
        address account,
        uint256 id,
        uint256 amount
    ) public {
        require(_roboToken.transferFrom(msg.sender, address(this), 1));
        _mint(account, id, amount, "");
    }
}

