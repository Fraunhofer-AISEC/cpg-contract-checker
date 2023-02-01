interface ComptrollerInterface {




function enterMarkets(address[] calldata cTokens) external returns (uint[] memory);
function exitMarket(address cToken) external returns (uint);

}
