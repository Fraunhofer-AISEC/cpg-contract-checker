pragma solidity ^0.5.11;

contract Hucha {

    address owner;
    mapping(address => bool) debtor;
    mapping(uint => uint) check; 


    event operations(string msg, uint amount);



    modifier segurity {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender; 
    }


    function getbalance() view public returns(uint) {
        return address(this).balance;
    }

    function enterFunds(uint amount) public payable {
        require(msg.value == amount);
        emit operations("Ingreso realizado de: ", amount);


    }

     function extractFunds(uint amount) segurity public {
              msg.sender.transfer(amount);
              emit operations("Se han sacado: ", amount);

    }

    function kill() segurity public {
        selfdestruct(msg.sender);
    } 



function paycheck(uint _check) public {
        require(debtor[msg.sender]);
        require(check[_check] != 0); 
        msg.sender.transfer(check[_check]);
        debtor[msg.sender] = false;

    }

    function setdebtor(address _address, uint _checkId, uint256  _amount) segurity public {
        check[_checkId] = _amount;
        debtor[_address] = true;

    }





}
