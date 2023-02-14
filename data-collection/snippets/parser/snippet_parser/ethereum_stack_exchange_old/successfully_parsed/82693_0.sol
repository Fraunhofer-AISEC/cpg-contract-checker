pragma solidity >0.6.2 <0.7.0;

contract D {
    uint public x;
    constructor(uint a) public payable {
        x = a;
    }
}

contract C {

    address[] public addresses;
    address[] public predictedAddresses;
    

    function createD(uint arg) public {
        D newD = new D(arg);
        newD.x();
        addresses.push(address(newD));
    }

    function createAndEndowD(uint arg, uint amount) public payable {
        
        D newD = new D{value: amount}(arg);
        newD.x();
    }

    function createSalted(bytes32 salt, uint arg) public {

        address predictedAddress = address(bytes20(keccak256(abi.encodePacked(
            byte(0xff),
            address(this),
            salt,
            keccak256(abi.encodePacked(
                        type(D).creationCode,
                        arg
                        ))

        ))));

        D d = new D{salt: salt}(arg);
        require (address(d) == predictedAddress);

        predictedAddresses.push(predictedAddress);

    } 

}
