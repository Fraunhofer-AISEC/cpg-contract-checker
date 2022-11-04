    pragma solidity ^0.4.21;


contract CryptoKitties  {

    address public owner;

    struct CKitties{
        string name;
        uint price;
    }


function CryptoKitties() public {
    owner = msg.sender;
}

modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}




    mapping (address => uint) kittytoUser;  
    CKitties[] kitties;

    event NewCryptoKitty(address owner, string name, uint price); 

    modifier cost (uint minCost){
        require(msg.value>= minCost && minCost >=0);
        _;
    }

function addNewKitty(string newName, uint newPrice) public payable cost(5000) {
    address sender = msg.sender;
    uint place =  kitties.push(CKitties(newName,newPrice));
    kittytoUser[sender] = place;
    emit NewCryptoKitty(sender, newName, newPrice);

}

function kill() public  onlyOwner{
    selfdestruct(owner);
}



function getName() public view returns (string){
        address sender = msg.sender;
        uint index = kittytoUser[sender]-1;
        return kitties[index].name;
}

function setName(string newName) public{
    address sender = msg.sender;
        uint index = kittytoUser[sender]-1;
        kitties[index].name = newName;
}

function getBalance() public view returns (uint){
    return address(this).balance;
}




}
