
pragma solidity ^0.8.7;

contract Create {

    struct Quote {
        string quote;
        bool exists;
    }

    mapping(uint256 => Quote) quote;

    function set(uint256 ID) external {
        quote[ID] = Quote("quote", true);    
    }

    function getQuote(uint256 ID) external view returns(Quote memory) {
        return quote[ID];
    }
}

interface ICreate {
    struct Quote {
        string quote;
        bool exists;
    }

    function getQuote(uint256 ID) external view returns (Quote memory);

    function set(uint256 ID) external;
}

contract MyContract {
    function setQuote(address CreateAddress, uint256 ID) external {
        ICreate(CreateAddress).set(ID);
    }

    function getQuote(address CreateAddress, uint256 ID) external view returns (ICreate.Quote memory _quote) {
        _quote = ICreate(CreateAddress).getQuote(ID);
    }
}
