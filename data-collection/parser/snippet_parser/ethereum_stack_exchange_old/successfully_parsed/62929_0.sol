pragma solidity >=0.4.22 <0.6.0;

contract MyPLMPOC {

    string private myContractName;
    uint private myContractLength;

    function setContractName(string memory myNewContractName) public {
         myContractName = myNewContractName;
    }

    function getContractName() public  returns(string memory)  {
        return myContractName;
    }


}
