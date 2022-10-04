# solc --abi --bin ./contracts/Wallet.sol -o ./build
./contracts/Wallet.sol:3:1: Error: Source "openzeppelin-eth/contracts/token/ERC20/IERC20.sol" not found: File outside of allowed directories.
import "openzeppelin-eth/contracts/token/ERC20/IERC20.sol";
^---------------------------------------------------------^
./contracts/Wallet.sol:4:1: Error: Source "openzeppelin-eth/contracts/token/ERC20/StandaloneERC20.sol" not found: File outside of allowed directories.
import "openzeppelin-eth/contracts/token/ERC20/StandaloneERC20.sol";
^------------------------------------------------------------------^
./contracts/Wallet.sol:5:1: Error: Source "openzeppelin-eth/contracts/ownership/Ownable.sol" not found: File outside of allowed directories.
import "openzeppelin-eth/contracts/ownership/Ownable.sol";
^--------------------------------------------------------^
./contracts/Wallet.sol:6:1: Error: Source "zos-lib/contracts/Initializable.sol" not found: File outside of allowed directories.
import "zos-lib/contracts/Initializable.sol";
