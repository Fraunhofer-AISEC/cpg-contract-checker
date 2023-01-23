pragma solidity ^0.4.18;
contract Houses {
    struct House {
        address owner;
    }    

    House[] public houses;

    function buyHouse() public payable {
        House memory tempHouse = House(msg.sender);
        houses.push(tempHouse);
    }

    function getTotalHomesSold() public view returns (uint256 count) {
        return houses.length;
    }
}
