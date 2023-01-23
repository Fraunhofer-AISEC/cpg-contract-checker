     
    pragma solidity >=0.7.0 <0.9.0;

contract BasicFunction 
{
string coinName = "Epic Coin";
uint public myBalance = 100;

struct Coin
{
    string name;
    string symbol;
    uint supply;
}
mapping(address=>Coin) internal myCoin;

function getGuess(uint _guess) public pure returns (bool) {
    if(_guess == 5)
    {
        return true;
    }
    else
    {
        return false;
    }
}

function multiplyBalance(uint _multipier) external {
 myBalance = myBalance * _multipier;
}

function findcoinIndex(string[] memory  _mycoin, string memory  find, uint _findForm) public pure returns(uint)
{
    
    for(uint i = _findForm; _mycoin.length; i++)
    {
        string memory  newcoin = _mycoin[i];
        if (keccak256(abi.encodePacked(newcoin)) == keccak256(abi.encodePacked(find)))
        {
            return i;
            
        }

    }
    return 999;

}

}
