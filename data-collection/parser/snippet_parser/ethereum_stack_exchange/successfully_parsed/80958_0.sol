

pragma solidity ^0.6.0;


contract ProxyData {
    address public proxied;
}

contract Proxy is ProxyData {
    constructor(address _proxied) public {
        proxied = _proxied;
    }

    receive () payable external {}

    fallback () external payable {
        address addr = proxied;
        assembly {
            let freememstart := mload(0x40)
            calldatacopy(freememstart, 0, calldatasize())
            let success := delegatecall(not(0), addr, freememstart, calldatasize(), freememstart, 32)
            switch success
            case 0 { revert(freememstart, 32) }
            default { return(freememstart, 32) }
        }
    }
}

contract KombuchaData is ProxyData {
    event FilledKombucha(uint amountAdded, uint newFillAmount);
    event DrankKombucha(uint amountDrank, uint newFillAmount);

    uint public fillAmount;
    uint public capacity;
    string public flavor;
}


contract KombuchaProxy is Proxy, KombuchaData {
    constructor (address proxied, string memory _flavor, uint _fillAmount, uint _capacity)
        public
        Proxy(proxied)
    {
        
        require(_fillAmount <= _capacity && _capacity > 0);
        flavor = _flavor;
        fillAmount = _fillAmount;
        capacity = _capacity;
    }
}




contract Kombucha is KombuchaData{

    function fill(uint amountToAdd) public {
        uint newAmount = fillAmount + amountToAdd;
        require(newAmount > fillAmount && newAmount <= capacity);
        fillAmount = newAmount;
        emit FilledKombucha(amountToAdd, newAmount);
    }
    function drink(uint amountToDrink) public {
        uint newAmount = fillAmount - amountToDrink;
        require(newAmount < fillAmount);
        fillAmount = newAmount;
        emit DrankKombucha(amountToDrink, newAmount);
        
    }
}
