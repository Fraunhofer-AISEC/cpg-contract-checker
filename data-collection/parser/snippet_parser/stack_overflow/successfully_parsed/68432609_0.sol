
pragma solidity 0.8.4;

contract ContractA {

    event TokensMinted(uint amount);

    function mint(uint amount) public {
        emit TokensMinted(amount);
    }

}
