    contract Lottery{
address payable public manager;
string public name;   
address [] players;
uint256 nTickets;
address winner;
bool enable;
uint256 minimunContribution;
mapping(address => uint) public balances;

constructor (string memory LotteryName, uint minimun, address payable creator) public  {
    manager = creator;
    name = LotteryName;
    winner = address(0);
    enable = true;
    minimunContribution = minimun;
}

modifier restricted() {
require(msg.sender == manager, "Access forbidden");
_;
}

function enterInToLottery() public payable {
    require(msg.value > minimunContribution && enable == true, "Insufficient funds to allow transfer");
    players.push(msg.sender);
    balances[msg.sender] += msg.value;
    nTickets++;
}


function paybackEther(bool newfinished) public restricted {
    enable = !newfinished; 


    selfdestruct(msg.sender);
}}
