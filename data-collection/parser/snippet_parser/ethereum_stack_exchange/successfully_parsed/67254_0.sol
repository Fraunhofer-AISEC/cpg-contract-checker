pragma solidity 0.4.21;


contract Factory {

    
    address public owner;
    
    address public authorizedCaller;
    
    address private ownerCandidate;
    
    address private authorizedCallerCandidate;
    
    mapping (address => bool) public UserWallets;
    
    bytes32 private ownerCandidateKeyHash;
    
    bytes32 private authorizedCallerCandidateKeyHash;

    
    event Transaction(address from, address to, uint256 value);
    
    event NewOwner(address owner);
    
    event NewAuthorizedCaller(address authorizedCaller);
    
    event NewUserWallet(address newWallet);

    function Factory() public {
        owner = msg.sender;
        authorizedCaller = msg.sender;
    }

    
    modifier onlyOwner {
        assert(msg.sender == owner);
        _;
    }

    
    modifier onlyAuthorizedCaller {
        assert(msg.sender == authorizedCaller);
        _;
    }

    modifier onlyUserWallets {
        assert(UserWallets[msg.sender] == true);
        _;
    }

    
    modifier onlyOwnerCandidate(bytes32 key) {
        assert(msg.sender == ownerCandidate);
        assert(keccak256(key) == ownerCandidateKeyHash);
        _;
    }

    
    modifier onlyAuthorizedCallerCandidate(bytes32 key) {
        assert(msg.sender == authorizedCallerCandidate);
        assert(keccak256(key) == authorizedCallerCandidateKeyHash);
        _;
    }

    

    function transferOwnership(address candidate, bytes32 keyHash) public onlyOwner {
        ownerCandidate = candidate;
        ownerCandidateKeyHash = keyHash;
    }
    
    function acceptOwnership(bytes32 key) external onlyOwnerCandidate(key) {
        owner = ownerCandidate;
        emit NewOwner(ownerCandidate);
    }

    

    function changeAuthorizedCaller(address candidate, bytes32 keyHash) public onlyOwner {
        authorizedCallerCandidate = candidate;
        authorizedCallerCandidateKeyHash = keyHash;

    }

    

    function acceptAuthorization(bytes32 key) external onlyAuthorizedCallerCandidate(key) {
        authorizedCaller = authorizedCallerCandidate;
        emit NewAuthorizedCaller(authorizedCallerCandidate);
    }


    
    function CreateNewUserWallet() public onlyAuthorizedCaller returns (address newWallet) {
        newWallet = new UserWallet(address(this));
        UserWallets[newWallet] = true;
        emit NewUserWallet(newWallet);
    }

    
    function execute(address to, uint256 value, bytes data) public onlyAuthorizedCaller {
        require(to.call.value(value)(data));
    }

    
    function LogTransaction(address from, address to, uint256 value) external onlyUserWallets {
        emit Transaction(from, to, value);
    }
}


contract UserWallet {
    Factory FactoryContract;
    

    function UserWallet(address _FactoryContract) public {
        FactoryContract = Factory(_FactoryContract);
    }

    modifier onlyAuthorizedCaller {
        assert(msg.sender == FactoryContract.authorizedCaller());
        _;
    }
    
    function() public payable {
        if (msg.value > 0) {
            FactoryContract.authorizedCaller().transfer(msg.value); 
            FactoryContract.LogTransaction(msg.sender, this, msg.value);
        }
    }
    
    function SweepTokens(address tokenContractAddress) public onlyAuthorizedCaller {
        ERC20Interface Token = ERC20Interface(tokenContractAddress);
        address Wallet = address(this);
        address AuthorizedCaller = FactoryContract.authorizedCaller();
        uint256 TokenBalance = Token.balanceOf(Wallet);
        if (TokenBalance > 0) {
            require(Token.transfer(AuthorizedCaller, TokenBalance));
        }

    }
    
    function execute(address to, uint256 value, bytes data) public onlyAuthorizedCaller {
        require(to.call.value(value)(data));
    }
}


contract ERC20Interface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
