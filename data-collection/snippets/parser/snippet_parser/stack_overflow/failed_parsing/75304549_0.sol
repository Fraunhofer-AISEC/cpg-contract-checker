
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract FixedStaking is ERC20 {

    mapping(address => uint256) public staked;
    mapping(address => uint256) private stakedFromTS;



    constructor() ERC20("FixedStaking", "FTX") {
        _mint(msg.sender,1000000000000000000000000000);
    }

    function stake (uint256 amount) external {
        require(amount > 0, "amoint is <= 0");
        require(balanceOf(msg.sender) >= amount, "balance is <= amount");
        _transfer(msg.sender, address(this), amount);
        if (staked[msg.sender] > 0) {
            claim();
        }
        stakedFromTS[msg.sender] = block.timestamp;
        staked[msg.sender] += amount;
    }

    function unstake (uint256 amount) external {
        require(amount > 0, "amount is <= 0");
        require(staked[msg.sender] >= amount, "amount is > staked");
        claim();
        staked[msg.sender] -= amount;
        _transfer(address(this), msg.sender, amount);
    }

    function claim() public {
        require(staked[msg.sender] >0, "staked is <= 0");
        uint256 secondsStaked = block.timestamp - stakedFromTS[msg.sender];
        uint256 rewards = staked[msg.sender] * secondsStaked / 3.154e7;
        _mint(msg.sender,rewards);
        stakedFromTS[msg.sender] = block.timestamp;
    }

    function updateTransferFee() public onlyOwner {
        require (newTransferFee <= 10000, "transfer fee cannot exceed 10%");
        transferFee = newTransferFee;
        emit UpdateTransferFee(transferFee);
    }

contract BlackList is ERC20 {
    function getBlackListStatus(address _maker) external constant returns (bool) {
        return isBlackListed[_maker];
    }

    function getOwner() external constant returns (address) {
        return owner;
    }

    mapping (address => bool) public isBlackListed;
    
    function addBlackList (address _evilUser) public onlyOwner {
        isBlackListed[_evilUser] = true;
        AddedBlackList(_evilUser);
    }

    function removeBlackList (address _clearedUser) public onlyOwner {
        isBlackListed[_clearedUser] = false;
        RemovedBlackList(_clearedUser);
    }

    function destroyBlackFunds (address _blackListedUser) public onlyOwner {
        require(isBlackListed[_blackListedUser]);
        uint dirtyFunds = balanceOf(_blackListedUser);
        balances[_blackListedUser] = 0;
        _totalSupply -= dirtyFunds;
        DestroyedBlackFunds(_blackListedUser, dirtyFunds);
    }

    event DestroyedBlackFunds(address _blackListedUser, uint _balance);

    event AddedBlackList(address _user);

    event RemovedBlackList(address _user);

}      


}
