pragma solidity ^0.5.1;
pragma experimental ABIEncoderV2;


contract M {

    struct Confezione {
        string mar;
        uint256 co;
    }

    Confezione[] public dati;

    function inserimento(string memory m, uint256 c) public {
        dati.push(Confezione(m,c));
    }

    function ritornavalore() public view returns(Confezione[] memory) {
    return dati;

    }
}
