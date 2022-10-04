
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract Ancestry is ERC20, ERC20Burnable, Pausable, Ownable {

    using SafeMath for *;

    
    address payable deployerWallet = payable(0xE76dfad0a129CD7B72E3E6aD172F98865998c1aB);
    
    address payable rewardsWallet = payable(0x9f5094675526898e4260a411241d374232021183); 
    address payable preSaleTokens = payable(0xE76dfad0a129CD7B72E3E6aD172F98865998c1aB); 

    
    mapping(address => uint256) private _excludedFromFee;

    
    struct TeamTimelocks{
        address teamMember;
        address fstLock;
        address sndLock;
        address thrLock;
        address frtLock;
    }

    TeamTimelocks[] team;



    
    
    

    

    
    
    uint256 public  PublicSaleDate = block.timestamp + 120;
    uint256 public  fifteenDaysInSeconds = 140;
    uint256 public  oneMonthInSeconds = 160;
    uint256 public  oneMonthAndAHalfInSeconds = 180;
    uint256 public  twoMonthsInSeconds = 200;

    constructor() ERC20("Ancestry", "ANC") {

        distributeAndLock();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    

    function distributeAndLock() internal {

        IERC20 _IERC20Token = IERC20(this);

        
        _mint(preSaleTokens, 2600000 * 10 ** decimals());

        
        _mint(rewardsWallet, 13000000 * 10 ** decimals());

        
        _mint(rewardsWallet, 3900000 * 10 ** decimals());

        
        
        uint256 teamTokensTotal        = 3900000 * 10 ** decimals();
        uint256 tokensPerMember        = teamTokensTotal.div(8);
        uint256 quarterTokensPerMember = tokensPerMember.div(4);

        
        team[0].teamMember = 0xE76dfad0a129CD7B72E3E6aD172F98865998c1aB;
        team[1].teamMember = 0x58d299cf28e508704646A95d78AEA4EFddd6B7c8;
        team[2].teamMember = 0xFe76F9F0aF1F8250CB30767461921e81871d9037;
        team[3].teamMember = 0xEaEEB732b67169F3Bc24DAA6271e95fc104e0FC0;
        team[4].teamMember = 0x631bB0244071aC67663241657c8312eCDb23A665;
        team[5].teamMember = 0xE8DD32180803095A57b4Ff1B475753ea5D1c3b8d;
        team[6].teamMember = 0x3C9E6083E2Db441843c9d6678f1E54cC9bb5B719;
        team[7].teamMember = 0xdDfACfD8B9dA4c15f61beB43B41Db12c33c6898F;

        for(uint i=0; i < team.length; i++) {
            team[i].fstLock = new TokenTimelock(_IERC20Token, team[i].teamMember, block.timestamp + fifteenDaysInSeconds);
            this.mint(team[i].fstLock, quarterTokensPerMember);
        }
    }

    function releaseFirstTL() public {
        for(uint i=0; i < team.length; i++)
            team[i].fstLock.release();
    }

    function releaseSecondTL() public {
        for(uint i=0; i < team.length; i++)
            team[i].sndLock.release();
    }

    function releaseThirdTL() public {
        for(uint i=0; i < team.length; i++)
            team[i].thrLock.release();
    }

    function releaseFourthTL() public {
        for(uint i=0; i < team.length; i++)
            team[i].frtLock.release();
    }
    
}
