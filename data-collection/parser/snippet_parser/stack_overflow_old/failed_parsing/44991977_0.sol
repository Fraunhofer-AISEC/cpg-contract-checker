pragma solidity ^0.1.0;

contract ToContract{
    FromContract fromContract = new FromContract();

    function getName() constant returns (string) {
        return fromContract.getName();
    }

}

contract FromContract{
    string name = 'dapp';

    function getName() constant return(string){
        return name;
    }

}
