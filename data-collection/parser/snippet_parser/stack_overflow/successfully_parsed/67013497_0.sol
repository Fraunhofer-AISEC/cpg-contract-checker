    function requestData(string memory _id, string memory _field) public {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillData.selector);
        request.add("get", "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/accounting/od/avg_interest_rates?sort=-record_date");
        string[] memory path = new string[](3);
        path[0] = "data";
        path[1] = _id;
        path[2] = _field;
        request.addStringArray("path", path);
        int timesAmount = 10**18;
        request.addInt("times", timesAmount);
        sendChainlinkRequestTo(oracle, request, fee);
    }
