pragma solidity >=0.5.0 <0.6.0;

contract CheckBehavior {

    mapping(address => uint256) _deposits;

    function depo() public payable{

        _deposits[msg.sender]= msg.value;

    }


    function withdrawA(uint256 _amt) public {

        msg.sender.transfer(_amt);
    }



    function withdrawB(address payable payee, uint256 _amt) public {

        payee.transfer(_amt);
}


this keeps track of addresses and one can condition based on it
    function withdrawWithGas(address payable payee) public {
        uint256 payment = _deposits[payee];

        _deposits[payee] = 0;

        payee.transfer(payment);
    }

}
