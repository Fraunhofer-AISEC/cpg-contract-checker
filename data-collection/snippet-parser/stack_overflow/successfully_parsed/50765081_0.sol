pragma solidity ^0.4.0;
contract Zootest {

struct Zoo {
    uint state;
    Animal[][2][3] animalarray;
    uint price;
}

 struct Animal {
    uint quantity;
    address Address;
}

mapping (uint => Zoo) zoo;

function openZoo (uint index) {
    Zoo memory newZoo = Zoo({
        state: 1,
        price: 0,
        animalarray: new Animal[][2][3](0)
    });
    zoo[index] = newZoo;
}

function enterZoo (uint index, uint x, uint y, uint quantity) public {
    Animal memory newAnimal = Animal({
        Address:msg.sender,
        quantity:quantity
    }); 
    zoo[index].price = zoo[index].price+msg.value;
    zoo[index].animalarray[x][y].push(newAnimal);
}
}