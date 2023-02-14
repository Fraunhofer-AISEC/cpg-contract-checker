
pragma solidity >=0.7.0 <0.9.0;


contract WLS
{
    mapping (address => uint) public balances;
    mapping (address => mapping (address=>uint)) public allowance;

    uint private totalSupply = 100000 * (10 ** 18);
    string public name = "Token name";
    string public symbol = "TKN";
    uint public decimals = 18;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    address owner = msg.sender;
    mapping(uint256 => bool) usedNonces;

    constructor() {

        balances[0x....]= 1000  * (10 ** 18);
    }

    function balanceOf(address user) public view returns (uint)
    {
        return balances[user];

    }

    function transfer(address to, uint value) public returns (bool)
    {
        require(balanceOf(msg.sender)>=value, "Insufficient funds");
        balances[to]+=value;
        balances[msg.sender]-=value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function TransferFrom(address from, address to, uint value) public returns (bool)
    {
        require(balanceOf(from)>=value, "Insufficient funds");
        require(allowance[from][msg.sender]>=value, "Insufficient delegation");
        balances[to]+=value;
        balances[from]-=value;
        emit Transfer(from, to, value);
        return true;
    }

    function approve(address spender, uint value) public returns (bool)
    {
        allowance[msg.sender][spender]=value;
        emit Approval(msg.sender, spender, value);
        return true;
    }



    function claimPayment(uint256 amount, uint256 nonce, bytes memory signature) external {
        require(!usedNonces[nonce]);
        usedNonces[nonce] = true;

        
        bytes32 message = prefixed(keccak256(abi.encodePacked(msg.sender, amount, nonce, this)));

        require(recoverSigner(message, signature) == owner);

        payable(msg.sender).transfer(amount);
    }

    
    function shutdown() external {
        require(msg.sender == owner);
        selfdestruct(payable(msg.sender));
    }

    
    function splitSignature(bytes memory sig)
        internal
        pure
        returns (uint8 v, bytes32 r, bytes32 s)
    {
        require(sig.length == 65);

        assembly {
            
            r := mload(add(sig, 32))
            
            s := mload(add(sig, 64))
            
            v := byte(0, mload(add(sig, 96)))
        }

        return (v, r, s);
    }

    function recoverSigner(bytes32 message, bytes memory sig)
        internal
        pure
        returns (address)
    {
        (uint8 v, bytes32 r, bytes32 s) = splitSignature(sig);

        return ecrecover(message, v, r, s);
    }

    
    function prefixed(bytes32 hash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}

