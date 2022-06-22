contract ERC20 is IERC20 {
...
}

contract ERC20Detailed is ERC20, IERC20Detailed {
...
}

contract AXSToken is ERC20Detailed, ERC20GatewayWhitelist {
...
}
