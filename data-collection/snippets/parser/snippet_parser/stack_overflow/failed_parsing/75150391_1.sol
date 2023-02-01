enter code here

 contract RiggedRoll is Ownable {

DiceGame public diceGame;

constructor(address payable diceGameAddress) {
    diceGame = DiceGame(diceGameAddress);
}






function riggedRoll(bytes32 riggedHash) public payable {
    riggedHash = address(diceGame).blockhash(block.number-1); 
}



receive() external payable { }
