pragma solidity ^0.4.19;

contract InterfaceWithMe {

    function call() returns (string);

}

contract Interfacing {

    address ckAddress = 0x9fe1c58215407d67719ba680360940056e5eceb7;
    InterfaceWithMe daContract = InterfaceWithMe(ckAddress);

    function call() returns (string) {
        return daContract.call();
    }
}