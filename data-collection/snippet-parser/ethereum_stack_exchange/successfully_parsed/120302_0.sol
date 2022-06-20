
pragma solidity ^0.8.0;

interface IUsingERC7772 {
    function setAsSenderFor(address _account) external;

    function setSupportedToken(address _token) external;

    event TokensReceived(
        address sender,
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes userData,
        bytes operatorData
    );

    event TokensToSend(
        address sender,
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes userData,
        bytes operatorData
    );
}
