contract Storage {

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

}

contract TokenA {

    address public storageAddress;

    function getAllowance(address _owner, address _spender) public returns (uint256) {
        return Storage(storageAddress). allowance( );
    }

}
