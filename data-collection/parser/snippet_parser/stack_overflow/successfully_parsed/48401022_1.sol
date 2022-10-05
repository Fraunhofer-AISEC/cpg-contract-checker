import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract ExampleContract is usingOraclize {

    string public EURGBP;
    string public value = "0.88086";
    event LogPriceUpdated(string price);
    event LogNewOraclizeQuery(string description);

    function ExampleContract() payable public{
        updatePrice();

    }

    function __callback(bytes32 myid, string result) public {
        if (msg.sender != oraclize_cbAddress()) revert();
        EURGBP = result;
        if (keccak256(result) != keccak256(value)) {
        LogPriceUpdated(value);
        }
        else { 
           LogPriceUpdated(result);
        }
    }

    function updatePrice() payable  public{
        if (oraclize_getPrice("URL") > this.balance) {
            LogNewOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer..");
            oraclize_query("URL", "json(http://api.fixer.io/latest?symbols=USD,GBP).rates.GBP");
        }
    }
}
