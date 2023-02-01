
pragma solidity >=0.4.21 <0.7.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract InvestmentToken is ERC20{

    string public name;
    string public symbol;
    uint256 public decimals = 0;
    uint256 public INITIAL_SUPPLY;

    uint256 public cost;
    address public parent;

    constructor(string memory _name, string memory _symbol, uint256 initalSupply,  uint256 _cost) public {
        name = _name;
        symbol = _symbol;
        INITIAL_SUPPLY = initalSupply;
        cost=_cost;
        parent = msg.sender;
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function buyToken(address receiver, uint256 amount) public {
        if (msg.sender != parent) {
            revert("You may only buy through the DPAC token");
        }

        uint256 tokensLeft = balanceOf(msg.sender);
        if (tokensLeft >= amount/cost){
            _transfer(msg.sender,receiver, amount/cost);
        } else {
            revert("There are no more tokens");
        }
    }

    
}


contract TheParentToken {
    string public name = "DPAC_Token";
    string public symbol = "DPAC";
    uint256 public decimals = 0;
    uint256 public INITIAL_SUPPLY = 10000;

    uint256 public numberOfTokens = 0;

    mapping(address => bool) public tokenWhiteList;
    InvestmentToken[] public allTokens;
    address public administrator;

    constructor() public {
        administrator = msg.sender;
        allTokens.push(new InvestmentToken("A","B",1000,1));
        allTokens.push(new InvestmentToken("B","C",1000,1));
        numberOfTokens = allTokens.length;
    }

    function createInvestorToken(string memory _name, string memory _symbol, uint256 initalSupply,  uint256 _cost) public {
        allTokens.push(new InvestmentToken(_name,_symbol,initalSupply,_cost));
        numberOfTokens = allTokens.length;
    }

    function addTokenToWhiteList(address newToken) public {
        if(msg.sender != administrator){
            revert("Not Admin");
        }
        tokenWhiteList[newToken]=true;
    }

    function removeTokenFromWhiteList(address newToken) public {
        if(msg.sender != administrator){
            revert("Not Admin");
        }
        tokenWhiteList[newToken]=false;
    }

}
