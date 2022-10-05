pragma solidity ^0.8.0;
import "./Ownable.sol";

contract upcomingRace is Ownable{

    mapping(string => bool) public horses;
    mapping(address => uint) internal winningBettors;
    struct Bet {
        address bettor;
        uint betSize;
        string horse;
    }
    Bet[] betPool;
    bool isEnabled = true;
    string race_id;
    uint startTime;
    uint cut = 5;
    event initialized(string, address);
    event Received(address, uint);
    address factory;

    constructor(string memory _race_id, string[12] memory _horses, uint _startTime) payable {
        initialized(_race_id, address(this));
        race_id = _race_id;
        startTime = _startTime;
        string memory _horse;
        for (uint i = 0; i < _horses.length; i++){
            _horse = _horses[i];
            horses[_horse] = true;
        }
        factory = msg.sender;
    }

    
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    function placeBet(uint  _betSize, string calldata _horse) public payable {
        
        require(isEnabled);
        
        uint betSize = _betSize*10**18;
        require(msg.value == betSize);
        require(horses[_horse]);
        address payable race = payable(address(this));
        race.transfer(betSize);
        Bet memory bet = Bet(msg.sender, betSize, _horse);
        betPool.push(bet);
    }

    function disableBetting() private onlyOwner() {
        isEnabled = false;
    }
    
    function raceOver() private onlyOwner() {
        address payable _owner = payable(owner());
        uint _cut = address(this).balance * cut /100;
        _owner.transfer(_cut);
    }
    
    function balanceOf() external view returns (uint){
        return address(this).balance;
    }
    
    function findWinningAmounts(string calldata _winner) internal view returns (uint){
        uint _winningPool = 0;
        for (uint i = 0; i < betPool.length; i++){
             
            if (keccak256(abi.encodePacked(_winner)) == keccak256(abi.encodePacked(betPool[i].horse))){
                _winningPool += betPool[i].betSize;
            }
        }
        return _winningPool;
    }
    function payWinners(string calldata _winner) public payable onlyOwner() {
        uint _winningPool = findWinningAmounts(_winner);
        uint _winnings;
        
        if (_winningPool > 0){
            for (uint i = 0; i < betPool.length; i++){
                 
                if (keccak256(abi.encodePacked(_winner)) == keccak256(abi.encodePacked(betPool[i].horse))){
                    address payable _bettor = payable(betPool[i].bettor);
                    _winnings = (betPool[i].betSize/_winningPool)*address(this).balance;
                    _bettor.transfer(_winnings);
                }
            }
        }
        
        else{
            address payable _owner = payable(owner());
             _owner.transfer(address(this).balance);
        }
        
    }
    
    function announceWinner(string calldata _winner) external onlyOwner() {
        raceOver();
        disableBetting();
        payWinners(_winner);
        
    }

}
