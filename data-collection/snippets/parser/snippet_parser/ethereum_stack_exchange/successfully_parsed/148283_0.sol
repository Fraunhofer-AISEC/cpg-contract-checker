

pragma solidity 0.8.17;

contract LotteryApplication
{
    address public manager;
    address payable [] public participants;
    address public LotteryWinner;
    uint public _TotalTokens;
    uint8 decimal;
    string public _TokenName;
    string public _TokenSymbol;
    uint public TokenPrice;
    mapping(address => uint)TokenBalance;
   
    
    constructor(string memory TokenName, string memory Tokensymbol)
    {
        manager = msg.sender;
        _TotalTokens = 1000;
        _TokenName = TokenName;
        _TokenSymbol = Tokensymbol;
        decimal = 18;
        TokenPrice = 100 wei;
    }

    
    
    receive() external payable   
    {
        require(msg.value == 100 wei, "Ticket Cost is 1 ether");
        participants.push(payable(msg.sender)); 
        TokenBalance[msg.sender] += 1 ;
        _TotalTokens -= 1;
    }

    
    function CheckBalance() public view returns(uint)
    {
        require(msg.sender == manager, "!!! You are not authorized");
        return address(this).balance;
    }

    
    function CheckTokenBalance(address _account) public view returns(uint)
    {
        uint balanceofToken;
        balanceofToken = TokenBalance[_account];
        return balanceofToken;
        
    }

    
    function random() public view returns (uint)
    {
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
    }

    
    
    
    function SelectWinner() public
    {
        require(msg.sender == manager, "!!! Access Denied, You are not the Manager");
        require(participants.length >= 3, "!!! Aborting, not enough participans");
        uint r = random();
        uint index = r % participants.length;
        address payable winner;
        winner = participants[index];
        winner.transfer(CheckBalance());
        LotteryWinner = winner;
        participants = new address payable[](0);
    }
    function Reset_tokens() public payable
    {
        require(msg.sender == manager, "Aborting, you are not the manager");
        uint length = participants.length;
        uint i;
        for(i = 0; i <= length;i++)
        {
            TokenBalance[payable(participants[i])] = 0;
        }
       _TotalTokens = 1000;
    }

}
