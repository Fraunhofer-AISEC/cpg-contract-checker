
contract MarsCoin is ERC20PresetMinterPauserUpgradeable {
    uint counter;

    function increment() public {
        counter += 1;
    }

    function getCounter() public view returns (uint) {
        return counter;
    }

    
    constructor() initializer {}

    
    function initialize(string memory name, string memory symbol, address owner) public initializer {
        require(owner != address(0x0), "New owner cannot be 0");
        counter = 0;
        __ERC20PresetMinterPauser_init(name, symbol);
        __ERC20_init(name, symbol);
        _setupRole(DEFAULT_ADMIN_ROLE, owner);
        _setupRole(MINTER_ROLE, owner);
        _setupRole(PAUSER_ROLE, owner);
        revokeRole(PAUSER_ROLE, _msgSender());
        revokeRole(MINTER_ROLE, _msgSender());
        revokeRole(DEFAULT_ADMIN_ROLE, _msgSender());
     }


    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override(ERC20PresetMinterPauserUpgradeable) {
        ERC20PresetMinterPauserUpgradeable._beforeTokenTransfer(from, to, amount);
    }
}


const { expect } = require("chai");
const { ethers, upgrades } = require("hardhat");

describe.only("Mars Coin tests", function () {
  let accounts;
  let deployer;
  let owner;

  let tokenInstance;

  let tokenName = "Mars Coin";
  let tokenSymbol = "MARS";
  const tokenAmount = '10000000000000000000';

  before(async function() {
    accounts = await ethers.getSigners();
    deployer = accounts[0];
    owner = accounts[1];
    user = accounts[2];
  })

  it("Should deploy MARS token with correct owner set", async function () {
    const MarsCoin = await ethers.getContractFactory("MarsCoin");
    tokenInstance = await upgrades.deployProxy(MarsCoin, [tokenName, tokenSymbol, owner.address], { initializer: 'initialize(string,string,address)', unsafeAllow: ['constructor'] });
    await tokenInstance.deployed();

    const adminRole = await tokenInstance.DEFAULT_ADMIN_ROLE();
    const minterRole = await tokenInstance.MINTER_ROLE();
    const pauserRole = await tokenInstance.PAUSER_ROLE();

    expect(await tokenInstance.name()).to.equal(tokenName);
    expect(await tokenInstance.symbol()).to.equal(tokenSymbol);

    expect(await tokenInstance.hasRole(adminRole, deployer.address)).to.equal(false);
    expect(await tokenInstance.hasRole(minterRole, deployer.address)).to.equal(false);
    expect(await tokenInstance.hasRole(pauserRole, deployer.address)).to.equal(false);

    expect(await tokenInstance.hasRole(adminRole, owner.address)).to.equal(true);
    expect(await tokenInstance.hasRole(minterRole, owner.address)).to.equal(true);
    expect(await tokenInstance.hasRole(pauserRole, owner.address)).to.equal(true);
  });

  it("Should mint tokens to user account", async function() {
    const tokenInstanceWithOwner = tokenInstance.connect(owner);
    await tokenInstanceWithOwner.mint(user.address, tokenAmount);
    const accountBalance = (await tokenInstance.balanceOf(user.address)).toString();
    expect(accountBalance).to.equal(tokenAmount)
  })

  it("Should try to call contract implementation contract with deployer", async function () {
    const tokenInstanceWithDeployer = tokenInstance.connect(deployer);
    expect(await tokenInstanceWithDeployer.name()).to.equal(tokenName)
  })

  it("Should change the MARS token proxy admin correctly", async function() {
    await upgrades.admin.changeProxyAdmin(tokenInstance.address, owner.address);
    expect(await upgrades.erc1967.getAdminAddress(tokenInstance.address)).to.equal(owner.address);
  })
  
  it.only("Should throw on trying to call contract implementation from new proxy admin owner", async function () {
    const MarsCoin = await ethers.getContractFactory("MarsCoin");
    tokenInstance = await upgrades.deployProxy(MarsCoin, [tokenName, tokenSymbol, owner.address], { initializer: 'initialize(string,string,address)', unsafeAllow: ['constructor'] });
    await tokenInstance.deployed();
    
    await upgrades.admin.changeProxyAdmin(tokenInstance.address, owner.address);
    expect(await upgrades.erc1967.getAdminAddress(tokenInstance.address)).to.equal(owner.address);

    await expect(tokenInstance.connect(owner).name()).to.be.revertedWith('TransparentUpgradeableProxy: admin cannot fallback to proxy target');
  })
});
