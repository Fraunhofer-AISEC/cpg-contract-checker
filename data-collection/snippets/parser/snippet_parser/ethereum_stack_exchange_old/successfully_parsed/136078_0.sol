pragma solidity ^0.8.0;



contract Validator{

    string name;
    address token= 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;


    function setName(string memory _name)public {
        require();
        name=_name;
    }
    

}
