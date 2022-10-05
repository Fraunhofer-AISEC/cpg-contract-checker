
import "/Users/lennard/Desktop/GGToken/node_modules/@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "/Users/lennard/Desktop/GGToken/node_modules/@openzeppelin/contracts/token/ERC20/ERC20Capped.sol";
import "/Users/lennard/Desktop/GGToken/node_modules/@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";

contract GGToken is ERC20Capped, ERC20Detailed, ERC20Burnable {

    constructor (uint256 cap)
        ERC20Detailed("GGToken", "GGT", 18)
        ERC20Capped(cap)
        public {
            _mint(msg.sender, 10000);
    }
}
