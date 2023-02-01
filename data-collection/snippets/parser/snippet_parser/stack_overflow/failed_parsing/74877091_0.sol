
pragma solidity ^0.8.0;

contract Demo {

    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function receiveFunds() public payable {


    }

    function transferTo(address targetAddr, uint amount) public {

        address payable_to = payable(targetAddr);
    }

    function getBalance(address target.Addr) public view returns(uint) {
        
        return targetAddr.balance;
    }

    string public myStr = "test";

    function demo(string memory newValueStr) public {
                
    string memory myTempStr = "temp";
    myStr = newValueStr;

    }
    
}
