pragma solidity 0.4.25;

contract Interface {
    function call() public pure returns (string);
    function isInterface() public pure returns(bool);
}

contract Interfacing {

    Interface daContract; 

    constructor(address theContract) public {
        daContract = Interface(theContract);
        require(daContract.isInterface());
    }

    function call() public view returns (string) {
        return daContract.call();
    }

}

contract InterfaceWithMe is Interface {

    function call() public pure returns (string) {
        return "Hello";
    }

    function isInterface() public pure returns(bool) {
        return true;
    }
}
