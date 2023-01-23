contract Bet {
address owner = 0x3618b7fFA11F5eE1c439f2B0C547a0e7feD7FE44;
uint totalPot = 0;
uint pot1 = 0;
uint pot2 = 0;
uint addressLUTIndex = 0;
bool gameOpen = true;

struct Player {
    uint choice;
    uint amount;
    bool isset;
}

mapping(address => Player) pot;
mapping(uint => address) playerLUT;

function () public payable {
    betforChoice(msg.sender, 1);     
    placeBet(msg.sender, msg.value);
}

function Bet() public payable {
    placeBet(msg.sender, msg.value);
}

function placeBet(address iplayer, uint amount) internal {
    if (pot[iplayer].isset) {
        totalPot += amount;
        pot[msg.sender].amount = amount;
        if (pot[iplayer].choice == 1) {
            pot1 += amount;
        } else {
            pot2 += amount;
        }
    }
}

modifier canSetChoice(address player, uint choice) {
    require(!pot[player].isset && (choice == 1 || choice == 2) && gameOpen);
    _;
}

function betforChoice(address player, uint user_choice) canSetChoice(player, user_choice) public {
    pot[player].choice = user_choice;
    pot[player].isset = true;
    playerLUT[addressLUTIndex] = player;
    addressLUTIndex++;

}

modifier onlyOwnerChoice(uint choice) {
    require(msg.sender == owner && (choice == 1 || choice == 2) && gameOpen);
    _;
}

function setWinner(uint owner_choice) onlyOwnerChoice(owner_choice) public {
    uint winningFactor = 0;
    uint dealerComission = 10;
...
}

modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}

function getPotSize() public view onlyOwner returns(uint)  {
    return totalPot;
}
function getPotSize1() public view onlyOwner returns(uint)  {
    return pot1;
}
function getPotSize2() public view onlyOwner returns(uint)  {
    return pot2;
}

}
