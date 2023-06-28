




contract DAOBalanceSnapShot {

    uint constant D160 = 0x10000000000000000000000000000000000000000;

    mapping (address => uint) public balanceOf;

    address public owner;

    function DAOBalanceSnapShot() {
        owner = msg.sender;
    }


    uint public totalSupply;
    uint public totalAccounts;
    bool public sealed;

    
    
    function fill(uint[] data) {
        if ((msg.sender != owner)||(sealed))
            throw;

        for (uint i=0; i<data.length; i++) {
            address a = address( data[i] & (D160-1) );
            uint amount = data[i] / D160;
            if (balanceOf[a] == 0) {   
                totalAccounts ++;
                balanceOf[a] = amount;
                totalSupply += amount;
            }
        }
    }

    function seal() {
        if ((msg.sender != owner)||(sealed))
            throw;

        sealed= true;
    }
}
