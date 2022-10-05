pragma solidity ^0.4.18;

contract Car {

    struct car {
      bool available;
    }

    car audi;

    function Car() public {
        audi = car(true);
    }

    function checkAvailability() public view returns (bool) {
        return(audi.available);
    }
}
