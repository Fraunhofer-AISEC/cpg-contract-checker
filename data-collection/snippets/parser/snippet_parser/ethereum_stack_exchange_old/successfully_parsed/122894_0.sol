contract Generator {
    constructor(address tokenAddress) {
        token = Token(tokenAddress);
    }

    function createUser(string calldata name) public {
        User user = new User(name, token)
    }
}

contract User is Ownable {
    Token token;
    
    constructor(string memory name, Token _token) {
        token = _token;
    }

    function startAction() public {
        token.mintSelf(5);
        
    }

    function completeAction() public {
        
        transferFrom(address(token), owner(), 5);
    }
}

contract Token is ERC20 {
    constructor() ERC20("Token", "TOKEN") {
        _mint(address(this), 0);
    }

    function mintSelf(uint256 qty) public {
        _mint(address(this), qty);
    }
}
