contract RidgeRoll is Ownable {
    DiceGame public diceGame;

    constructor(DiceGame diceGameAddress) {
        diceGame = diceGameAddress;
    }
}
