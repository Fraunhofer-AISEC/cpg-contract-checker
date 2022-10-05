

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/presets/ERC1155PresetMinterPauser.sol";

contract GameV2 is ERC1155PresetMinterPauser, Ownable {

    uint256 public constant APPLE = 0;
    uint256 public constant PEAR = 1;
    uint256 public constant CHERRY = 2;

    uint256[] public mintedTotal = [0, 0, 0];
    uint256 public mintedPublicly;
    uint256 public maxAvailableForPublicMint = 1000;
    uint256[] public ratesForPublicMint = [0.01 ether, 0.01 ether, 0.01 ether];

    
    mapping(uint256 => mapping(address => uint256)) private Users;

    
    uint256 public fruitToBurn = PEAR;
    uint256 public fruitToMint = CHERRY;

    constructor() ERC1155PresetMinterPauser("https://address.io/{id}.json")
    {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function mint(address user, uint256 id, uint256 amount) public {
        require(hasRole(MINTER_ROLE, _msgSender()), "ERC1155PresetMinterPauser: must have minter role to mint");
        require(0 <= id && id <= mintedTotal.length, "Fruit does not exists!");
        mintedTotal[id] = mintedTotal[id].add(amount);
        Users[id][user] = Users[id][user].add(amount);
        _mint(user, id, amount, "");
    }

    
    function withdraw() public {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "ERC1155PresetMinterPauser: must have minter role to mint");
        require(address(this).balance > 0, "Balance is zero, cannot withdraw");
        payable(owner()).transfer(address(this).balance);
    }

    
    function burnToGainFruit(uint256 id, uint256 amount) public {
        require(0 <= id && id <= mintedTotal.length, "Fruit does not exists!");
        require(id == fruitToBurn, "This fruit cannot be burnt!");
        address user = msg.sender;
        for (uint i=1; i <= amount; i++) {
            require(Users[id][user] > 0, "There is nothing to burn");
            Users[id][user] = Users[id][user].sub(1);
            _burn(user, id, 1);
        }
    }

    function setBurnToGainParameters(uint256 _fruitToBurn, uint256 _fruitToMint)
    external returns (bool) {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "ERC1155PresetMinterPauser: must have admin role to change variables");
        require(0 <= _fruitToBurn && _fruitToBurn < mintedTotal.length, "Fruit to burn does not exists!");
        require(0 <= _fruitToMint && _fruitToMint < mintedTotal.length, "Fruit to mint does not exists!");
        fruitToBurn = _fruitToBurn;
        fruitToMint = _fruitToMint;
        return true;
    }

}
