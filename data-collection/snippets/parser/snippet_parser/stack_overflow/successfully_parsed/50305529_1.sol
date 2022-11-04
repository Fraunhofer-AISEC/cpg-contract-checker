pragma solidity ^0.4.21;

interface token {
    function transfer(address receiver, uint amount) external;
    function getTotalSupply() external returns (uint256 _totalSupply);
    
}

contract EqzipCrowdsale {

    string public constant whitePaperForEqzip = "The total supply of eqcoin is 100000 which corresponds to: \n\
    1. 1% of Eqzip stock. \n\
    2. 0.01% of Eqcoin stock. \n\
    3. 10% of Lostk stock. \n\
    4. Get the EQC corresponding to the price of eqcoin ico. \n\
    5. If the Ether from one person's investment is greater than or equal to 333, \
    hope life offers one cloned resurrection place (only 3 places, take the top 3). \n\
    6. Hired Hope Media to provide Growth Hacker, product design, and business architecture design for Ethereum. \n\
    7. Prior to joining eqzip work, under the same conditions to participate in the next round of financing eqzip. \n\
    The decimals of Eqcoin is 18... \n\
    owner: Xun Wang \n\
    wechat: nju20006 \n\
    email: 10509759@qq.com \n\
    URL: www.eqzip.com www.eqzip.cn www.lostk.com www.lostk.cn github.com/eqzip/eqcoin github.com/eqzip/lostk \n\
    ";

    
    address public owner;

    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Burn(string reason, uint256 value);

    uint public fundingGoal;
    uint public amountRaised;
    uint public funderNumbers;
    uint public deadline;
    struct BalanceOfFounder{
        uint256 _ether;
        bool isSentToken;
    }
    
    mapping(address => BalanceOfFounder) public balanceOfEther;

    token public tokenReward;

    address public beneficiary;
    bool burnedUnsaleToken = false;

    event GoalReached(address recipient, uint totalAmountRaised);

    
    string public milestone;
    
    uint256 public totalSupply;

    event Log(string log, address _address, uint256 value);

    
    function EqzipCrowdsale(
        address ifSuccessfulSendTo,
        uint fundingGoalInEthers,
        uint durationInMinutes,
        address addressOfTokenUsedAsReward
    ) public {

        
        beneficiary = ifSuccessfulSendTo;
        fundingGoal = fundingGoalInEthers * 1 ether;
        deadline = now + durationInMinutes * 1 minutes;
        tokenReward = token(addressOfTokenUsedAsReward);
        totalSupply = tokenReward.getTotalSupply();
        owner = msg.sender;
        emit Log("cons", owner, 0);
        

    }

    
    function () beforeDeadline public payable {
        balanceOfEther[msg.sender]._ether += msg.value;
        balanceOfEther[msg.sender].isSentToken = false;
        amountRaised += msg.value;
        beneficiary.transfer(msg.value);
        emit GoalReached(msg.sender, msg.value);
    }

    modifier afterDeadline() { if (now > deadline) _; }

    modifier beforeDeadline() { if (now <= deadline) _; }

    function getReward() afterDeadline public {
        emit Log("getReward", owner, 0);
        

        
        

        emit Log("getReward after require", msg.sender, 1);

        
        balanceOfEther[msg.sender].isSentToken = true;

        
        
        
        
        
        
        

        if(amountRaised < fundingGoal && !burnedUnsaleToken){
            burnedUnsaleToken = true;
            totalSupply = (totalSupply*amountRaised)/fundingGoal;
            emit Burn("Token not sold out all the sold value is", totalSupply);
        }

        emit Log("getReward tokenReward.transfer", msg.sender, 2);
        tokenReward.transfer(msg.sender, (balanceOfEther[msg.sender]._ether*totalSupply)/amountRaised);
        emit Log("getReward after tokenReward.transfer", msg.sender, 3);
        

    }

    function getBalanceOfEther(address _address) public payable returns(uint256) {

        emit Log("getBalanceOfEther", _address, balanceOfEther[_address]._ether);
        return balanceOfEther[_address]._ether;

    }

    function updateMilestone(string str) public {
        emit Log("updateMilestone", msg.sender, 0);
        milestone = strConcat(milestone, "\n", toAsciiString(msg.sender), "\n", str);
    }

    function strConcat(string _a, string _b, string _c, string _d, string _e) internal pure returns (string){
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        bytes memory _be = bytes(_e);
        string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
        bytes memory babcde = bytes(abcde);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
        for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
        for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
        for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
        for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
        return string(babcde);
    }

function toAsciiString(address x) internal pure returns (string) {
    bytes memory s = new bytes(40);
    for (uint i = 0; i < 20; i++) {
        byte b = byte(uint8(uint(x) / (2**(8*(19 - i)))));
        byte hi = byte(uint8(b) / 16);
        byte lo = byte(uint8(b) - 16 * uint8(hi));
        s[2*i] = char(hi);
        s[2*i+1] = char(lo);           
    }
    return string(s);
}

function char(byte b) internal pure returns (byte c) {
    if (b < 10) return byte(uint8(b) + 0x30);
    else return byte(uint8(b) + 0x57);
}

}
