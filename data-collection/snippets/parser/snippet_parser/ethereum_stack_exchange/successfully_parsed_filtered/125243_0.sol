import '@openzeppelin/contracts@4.4.2/token/ERC20/ERC20.sol';

contract Token is ERC20 {
  address public admin;

  constructor(string memory name, string memory symbol) ERC20(name, symbol) {
    admin = msg.sender;
  }

  function updateAdmin(address updateadmin) external {
    require(msg.sender == admin, 'only admin');
    admin = updateadmin;
  }

  function mint(address to, uint amount) external {
    require(msg.sender == admin, 'fail, admin only');
    _mint(to, amount);
  }

  function burn(address owner, uint amount) external {
    require(msg.sender == admin, 'fail, admin only');
    _burn(owner, amount);
  }

}
