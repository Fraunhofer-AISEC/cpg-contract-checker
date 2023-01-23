

pragma solidity 0.8.11;

contract first{

    string public name;
    string public symbol;
    uint public totalSupply;

    mapping(address=>uint) public balances;

    function setAll(string memory _name, string memory _symbol, uint _totalSupply)public virtual{
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
    }

    function mint()public{
        balances[tx.origin] += 1;
        totalSupply -= 1;
    }

}


contract second {

    string public name;
    string public symbol;
    uint public totalAmount;

    address public _first;

    constructor(address fiirst){
        _first = fiirst;
    }

    function set(string memory _name, string memory _symbol, uint _totalAmount)public{
        first _fir = first(address(_first));
        _fir.setAll(_name, _symbol, _totalAmount);
        _fir.mint();
        _totalAmount -= 1;
        name = _name;
        symbol = _symbol;
        totalAmount =_totalAmount;
    }
}
