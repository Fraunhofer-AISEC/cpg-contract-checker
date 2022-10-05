pragma solidity ^0.4.19;

contract Ten {

    uint counter = 0;

    function increment() external {

        counter++;

        if(counter == 10) {
            
            counter = 0;
        }

    }

}
