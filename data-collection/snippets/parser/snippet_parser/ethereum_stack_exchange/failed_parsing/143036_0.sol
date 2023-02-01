struct Player{
    address id;
    uint256 balance;
}
....

Player memory p = Player(0xHJ76...uy7, 100); 
...

Player memory p;
p.id = 0xHJ76...uy7;
p.balance = 100;
