pragma solidity ^0.8.0;

contract testContract {

    bool reverseEvil = false;

    event EvilChanged(bool evilStatus);

    function changeEvil() public virtual {
        if (reverseEvil == false) {
            reverseEvil = true;
        } else {
            reverseEvil = false;
        }
        emit EvilChanged(reverseEvil);
    } 
    
    function pepeStatus() public view virtual returns(string memory) {
        if (reverseEvil == false) {
            return "pepe is bad";
        } else {
            return "pepe is good";
        }
    }
    
    function lolaStatus() public view virtual returns(string memory) {
        if (reverseEvil == false) {
            return "lola is good";
        } else {
            return "lola is bad";
        }
    }
}
