
pragma solidity ^0.8.0;

import "./IUsingERC7772.sol";
import "@openzeppelin/contracts/token/ERC777/IERC777.sol";
import "@openzeppelin/contracts/token/ERC777/IERC777Sender.sol";
import "@openzeppelin/contracts/token/ERC777/IERC777Recipient.sol";
import "@openzeppelin/contracts/utils/introspection/IERC1820Registry.sol";
import "@openzeppelin/contracts/utils/introspection/ERC1820Implementer.sol";

contract UsingERC7772 is
    IUsingERC7772,
    IERC777Sender,
    IERC777Recipient,
    ERC1820Implementer
{
    IERC1820Registry private _erc1820 =
        IERC1820Registry(0x1820a4B7618BdE71Dce8cdc73aAB6C95905faD24);
    bytes32 public constant TOKENS_RECIPIENT_INTERFACE_HASH =
        keccak256("ERC777TokensRecipient");
    bytes32 public constant TOKENS_SENDER_INTERFACE_HASH =
        keccak256("ERC777TokensSender");

    address public token;
    mapping(address => uint256) public userToHolding;

    constructor() {
        _erc1820.setInterfaceImplementer(
            address(this),
            TOKENS_RECIPIENT_INTERFACE_HASH,
            address(this)
        );
    }

    function setAsSenderFor(address _account) external override {
        _registerInterfaceForAddress(TOKENS_SENDER_INTERFACE_HASH, _account);
    }

    function setSupportedToken(address _token) external override {
        token = _token;
    }

    function withdraw(uint256 _amount) external {
        require(_amount > 0, "zero amount");
        require(userToHolding[msg.sender] >= _amount, "insufficient funds");
        require(
            IERC777(token).balanceOf(address(this)) >= _amount,
            "contract insufficient funds"
        );

        userToHolding[msg.sender] -= _amount;
        IERC777(token).send(msg.sender, _amount, "");
    }

    function tokensReceived(
        address _operator,
        address _from,
        address _to,
        uint256 _amount,
        bytes calldata _userData,
        bytes calldata _operatorData
    ) external override {
        require(
            msg.sender == token,
            "the calling ERC777 token must match supported token"
        );
        
        userToHolding[_from] += _amount;

        emit TokensReceived(
            msg.sender,
            _operator,
            _from,
            _to,
            _amount,
            _userData,
            _operatorData
        );
    }

    function tokensToSend(
        address _operator,
        address _from,
        address _to,
        uint256 _amount,
        bytes calldata _userData,
        bytes calldata _operatorData
    ) external override {
        require(_amount > 0, "zero amount");
        emit TokensToSend(
            msg.sender,
            _operator,
            _from,
            _to,
            _amount,
            _userData,
            _operatorData
        );
    }
}
