contract ERC20Wrapper is ERC20, ERC1155Receiver {
    uint256 public tokenId;
    IShareToken public shareToken;
    IERC20 public cash;
    address public augurFoundry;

    
    constructor(
        address _augurFoundry,
        IShareToken _shareToken,
        IERC20 _cash,
        uint256 _tokenId,
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) public ERC20(_name, _symbol) {
        _setupDecimals(_decimals);
        augurFoundry = _augurFoundry;
        tokenId = _tokenId;
        shareToken = _shareToken;
        cash = _cash;
    }

    
    function wrapTokens(address _account, uint256 _amount) public {
        if (msg.sender != augurFoundry) {
            shareToken.safeTransferFrom(
                msg.sender,
                address(this),
                tokenId,
                _amount,
                ""
            );
        }
        _mint(_account, _amount);
    }

    
    function unWrapTokens(address _account, uint256 _amount) public {
        if (msg.sender != _account && msg.sender != augurFoundry) {
            uint256 decreasedAllowance = allowance(_account, msg.sender).sub(
                _amount,
                "ERC20: burn amount exceeds allowance"
            );
            _approve(_account, msg.sender, decreasedAllowance);
        }
        _burn(_account, _amount);

        shareToken.safeTransferFrom(
            address(this),
            _account,
            tokenId,
            _amount,
            ""
        );
    }
}