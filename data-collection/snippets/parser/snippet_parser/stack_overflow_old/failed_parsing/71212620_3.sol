 Compiling ./contracts/Migrations.sol
> Compiling ./contracts/PreSale.sol
> Compiling ./contracts/tFief.sol
> Compiling @openzeppelin/contracts/GSN/Context.sol
> Compiling @openzeppelin/contracts/crowdsale/Crowdsale.sol
> Compiling @openzeppelin/contracts/math/SafeMath.sol
> Compiling @openzeppelin/contracts/token/ERC20/ERC20.sol
> Compiling @openzeppelin/contracts/token/ERC20/ERC20Detailed.sol
> Compiling @openzeppelin/contracts/token/ERC20/IERC20.sol
> Compiling @openzeppelin/contracts/token/ERC20/SafeERC20.sol
> Compiling @openzeppelin/contracts/utils/Address.sol
> Compiling @openzeppelin/contracts/utils/ReentrancyGuard.sol

project:/contracts/tFief.sol:13:1: DeclarationError: Identifier already declared.
contract ERC20Detailed {
^ (Relevant source part starts here and spans across multiple lines).
project:/contracts/tFief.sol:10:1: The previous declaration is here:
import '@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol';
^-------------------------------------------------------------^
,project:/contracts/tFief.sol:23:1: DeclarationError: Identifier already declared.
contract ERC20 is ERC20Detailed {
^ (Relevant source part starts here and spans across multiple lines).
project:/contracts/tFief.sol:11:1: The previous declaration is here:
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
