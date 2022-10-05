function bet() public payable {
    require(msg.value == 0.1 ether);
    pingOracle();
}

function __callback(bytes32 _queryId, string _result, bytes _proof) public onlyOraclize  {

    if (oraclize_randomDS_proofVerify__returnCode(_queryId, _result, _proof) != 0) {
        oracleFailed = true;
    } else {
        uint randomN = (uint(keccak256(abi.encodePacked(_result))) % (max.sub(min)).add(min));
        revealWinner(randomN);
        oracleFailed = false;
    }

    if(oracleFailed) {
        count = count.add(1);
        pingOracle();
    }
}

function pingOracle() private {
    oraclize_setProof(proofType_Ledger);
    bytes32 queryId = oraclize_newRandomDSQuery(delay, N, gasOraclize); 
}

function revealWinner(uint _index) internal {
    uint amount = pot.sub(amountforTeam).sub(gasOraclize.mul(gasPriceOraclize));
    winner = users[_index];
    winner.transfer(amount);
}
