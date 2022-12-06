pragma solidity >=0.4.21 < 0.6.0;

contract ContractWallet {
    constructor() public{
    }
}

contract deposit {
    mapping (address=>ContractWallet) public users;

    constructor () public { }

    function testDeposit(
    )
        public
        payable
    {
        ContractWallet _newWallet = new ContractWallet();
        address(_newWallet).transfer(msg.value);
        users[msg.sender] = _newWallet;
    }

}
