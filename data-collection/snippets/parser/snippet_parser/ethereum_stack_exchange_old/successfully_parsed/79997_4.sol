contract Escrow {
    address game;
    address player1;
    address player2;

    Escrow addr = Escrow(this);
    address payable escrowWallet = address(uint160(address(addr)));

    constructor(address _player1, address _player2, address _game) public {
        player1 = _player1;
        player2 = _player2;
        game = _game;
    }
}
