
contract Coin {
    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() public {
        minter = msg.sender;
    }
    
    function mint(address receiver, uint amount) public {
        require(minter == receiver, 'Cannot Mint! Minter is not contract Creator!');
        require(amount < (1 * (10^60)), 'Amount requested too High for minting');
        balances[receiver] = amount;
    }
    
    function send(address receiver, uint amount) public {
        require(balances[minter] >= amount, 'Coin balance to low for transaction!');
        balances[minter] = -amount;
        balances[receiver] = amount;
        emit Sent(minter, receiver, amount);
    } 
    
}```

>  [vm] from: 0x5B3...eddC4to: Coin.mint(address,uint256)
> 0xEf9...10eBfvalue: 0 weidata: 0x40c...00036logs: 0hash: 0xc0a...40b8b
> transact to Coin.mint errored: VM error: revert.
> 
> revert    The transaction has been reverted to the initial state. Reason
> provided by the contract: "Amount requested too High for minting".
> Debug the transaction to get more information.
