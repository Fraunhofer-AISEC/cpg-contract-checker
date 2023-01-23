

pragma solidity >=0.7.0 <0.9.0;

contract Jackpot {
    
    uint256 public pot;
    mapping (address => uint256) public balances;
    address[] public participators;
    address public minter;

    constructor(){
        minter = msg.sender;
    }

    function addToPot() public payable {
        balances[msg.sender] += msg.value;
        pot += msg.value;
        participators.push(msg.sender);
    }

    modifier onlyOwner {
        require(msg.sender == minter);
        _;
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp)))%100;
    }

    function sendToWinner() payable public onlyOwner {
        uint8[100] memory participatorsRates;
        uint8 rate;
        uint8 participatorsRatesIndex=0;
        for(uint8 participatorIndex = 0; participatorIndex<participators.length; participatorIndex++){
            rate = uint8(balances[participators[participatorIndex]]*100/pot);
            for(; participatorIndex<rate ; participatorsRatesIndex++){
                participatorsRates[participatorsRatesIndex] = participatorIndex;
            }
            balances[participators[participatorIndex]]=0;
        }
        uint8 winningParticipatorIndex = participatorsRates[random()];

        payable(participators[winningParticipatorIndex]).transfer(pot);
    }

}
