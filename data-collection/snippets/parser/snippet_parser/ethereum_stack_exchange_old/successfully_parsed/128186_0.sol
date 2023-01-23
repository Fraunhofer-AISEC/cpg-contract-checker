address public  bugToken;
address public devAddress;
address dead = 0x000000000000000000000000000000000000dEaD;
uint256 private EGGS_TO_HATCH_1MINERS = 1080000;
uint256 private PSN = 10000;
uint256 private PSNH = 5000;
uint256 private devFeeVal = 2;
bool private initialized = false;
mapping (address => uint256) private hatcheryMiners;
mapping (address => uint256) private claimedEggs;
mapping (address => uint256) private lastHatch;
mapping (address => address) private referrals;
uint256 private marketEggs;

constructor() {
    bugToken=setbugToken;
    devAddress=msg.sender;
}

function setbugToken(address bug) public onlyOwner {
bugToken =  bug;

}
