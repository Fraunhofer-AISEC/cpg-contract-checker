pragma solidity '0.5.1';

contract MyFirstContract {
    uint productid;
    string public productname;

    function setname (string memory name1) public {
        productname = name1;
    }

    function getname () public view returns (string memory) {
        return productname;
    }
}
