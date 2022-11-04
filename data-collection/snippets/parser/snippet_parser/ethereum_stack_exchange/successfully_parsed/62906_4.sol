pragma solidity '0.5.11';

contract Hello {

    string public productname='Hello World';


    function setname (string memory name1) public {
        productname = name1;
    }

    function getname () public view returns (string memory) {
        return productname;
    }
}
