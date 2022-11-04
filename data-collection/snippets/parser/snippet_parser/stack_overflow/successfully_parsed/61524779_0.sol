pragma solidity >=0.4.22 <0.7.0;

contract Storage {

    struct Client {
        bool enrolled;
        bytes32 fullName;
        address[] reference;
    }

    Client newClient = Client(true, 0x7465737400000000000000000000000000000000000000000000000000000000, address[]);
}
