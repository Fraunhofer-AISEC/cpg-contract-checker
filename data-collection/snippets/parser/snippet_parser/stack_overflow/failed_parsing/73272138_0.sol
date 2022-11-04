
pragma solidity >=0.7.0<0.9.0;

contract Withdraw{
    constructor()payable{}
    fucntion withdrawByTransfer() public {
        paybale(msg.sender).transfer(1 ether);
    }

    fucntion withdrawBySend()public{
        bool success = paybale(msg.sender).send(1 eth);
        require(succeess);
    }

    fucntion withdrawByCall() public returns(bytes memory){
        (bool succeess,bytes memory result) = payable(msg.sender).call{value: require(success)};

        return result;
    }
}
