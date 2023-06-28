pragma solidity ^0.8.15;



contract sendeth{

    
    address payable public target = payable(xxxxwalletAddress);
    uint public etherAmount = 1 ether;


    function sendEth() public payable {
        payable(target).transfer(etherAmount);
    }

}

