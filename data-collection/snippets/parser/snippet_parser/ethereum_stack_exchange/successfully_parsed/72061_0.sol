pragma solidity ^0.4.24;

contract MultiSigContract {
    mapping (address => bool) public IsSigner;
    address public Executer;
    address[] public Signers;

    function MultiSigContract(address[] _signers, address _executer) public {
        require(_executer != 0x0);
        Signers = _signers;
        Executer = _executer;
        for (uint i = 0; i < Signers.length; i++) {
            IsSigner[Signers[i]] = true;
        }        
    }

    function execute(address destination, uint amount, uint8[] sigV, bytes32[] sigR, bytes32[] sigS) public {
        require(sigR.length == sigS.length && sigR.length == sigV.length);
        require(sigR.length == Signers.length);
        require(msg.sender == Executer);
        require(address(this).balance >= amount);

        address[] recoveredAddresses;
        bytes32 txHash = keccak256("\x19Ethereum Signed Message:\n72", this, destination, amount);

        for(uint8 i = 0; i < Signers.length; i++) {
            address recovered = ecrecover(txHash, sigV[i], sigR[i], sigS[i]);
            require(IsSigner[recovered] == true);
            recoveredAddresses.push(recovered);
        }

        for(uint8 j = 0; j < Signers.length; j++) {
            require(contains(Signers[j], recoveredAddresses));
        }

        destination.transfer(amount);
    }

    function contains(address _address, address[] _addressArray) private pure returns (bool) {
        for(uint8 i = 0; i < _addressArray.length; i++) {
            if (_addressArray[i] == _address) {
                return true;
            }
        }

        return false;
    }

    function () public payable {}
}
