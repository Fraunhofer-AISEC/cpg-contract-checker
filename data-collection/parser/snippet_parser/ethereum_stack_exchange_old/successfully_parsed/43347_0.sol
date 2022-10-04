contract owned {
    function owned() public { owner = msg.sender; }
    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

contract TestcontractCrowdSale is owned {
    uint public tokens_total = 0;

    struct holder {
        uint tokens_bonus_balance;
        uint tokens_all_balance;
        bool tokens_bonus_canspent;
        uint ethers_crowdfunded;
        uint list_pointer;
    }

    mapping (address => holder) public holders;
    address[] public holdersList;

    mapping (address => mapping (address => uint256)) public allowed;

    function checkIsHolder(address holderAddress) public constant returns (bool isIndeed) {
        if(holdersList.length == 0) return false;
        return (holdersList[holders[holderAddress].list_pointer] == holderAddress);
    }

    function getHoldersCount() public constant returns(uint count) {
        return holdersList.length;
    }

    function newHolder(address holderAddress) public returns(bool success) {
        if (!checkIsHolder(holderAddress)) {
            
            holders[holderAddress].list_pointer = holdersList.push(holderAddress) - 1;
        }
        return true;
    }

    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return holders[tokenOwner].tokens_all_balance;
    }

    function preprint(address _for, uint tokens) onlyOwner public returns (bool printed, address __for, uint bonus_all_tokens) {
        newHolder(_for);
        holders[_for].tokens_all_balance += tokens;
        holders[_for].tokens_bonus_balance += tokens;
        holders[_for].tokens_bonus_canspent = false;
        tokens_total += tokens;
        return (true, _for, holders[_for].tokens_bonus_balance );
    }
}
