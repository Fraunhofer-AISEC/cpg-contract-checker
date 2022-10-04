contract AdContractTest3 is usingOraclize {
    string public calc_script_base_url = "http://5.45.80.18/ad-price-calculator.php";
    uint public total_price_in_szabo;
    uint public szabo_per_placement;
    uint public szabo_per_view;
    address public client;
    address public blogger;

    event LogPriceUpdated(string price);
    event LogNewOraclizeQuery(string description);
    event LogNotEnoughEther();
    event LogEtherSent();
    event LogOnDeposit(address sender, uint amount);

    function AdContractTest3(uint price_in_szabo_per_placement, uint price_in_szabo_per_view, address client_address, address blogger_address) public payable {
        szabo_per_placement = price_in_szabo_per_placement;
        szabo_per_view = price_in_szabo_per_view;
        client = client_address;
        blogger = blogger_address;
    }

    function strConcat(string s1, string s2, string s3, string s4, string s5, string s6, string s7) internal pure returns (string)
    {
        return strConcat(strConcat(s1, s2, s3, s4), strConcat(s5, s6, s7));
    }

    function __callback(bytes32 myid, string result) public {
        require(msg.sender == oraclize_cbAddress());
        myid; 
        total_price_in_szabo = parseInt(result);
        LogPriceUpdated(result);
    }

    function updatePrice(string video_url) public payable returns(string) {
        if (oraclize_getPrice("URL") > this.balance) {
            LogNewOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            var url = strConcat(calc_script_base_url, "?price_in_szabo_per_placement=", uint2str(szabo_per_placement), "&price_in_szabo_per_view=", uint2str(szabo_per_view), "&video_url=", video_url);
            oraclize_query("URL", strConcat("json(", url, ").total_price_in_szabo"));
            var log_msg = strConcat("Oraclize query '", url, "' was sent, standing by for the answer...");
            LogNewOraclizeQuery(log_msg);
        }
    }

    function payForWork() public {
        if (total_price_in_szabo * 1 szabo > this.balance) {
            LogNotEnoughEther();
        } else {
            blogger.transfer(total_price_in_szabo * 1 szabo);
            LogEtherSent();
        }
    }

    function onDeposit() public payable {
        LogOnDeposit(msg.sender, msg.value);
    }
}
