function chooseHourly() public {
   address HourlyWinner = pickWinner(hourlyParticipants);
..
}

function chooseDaily() public {
   address dailyWinner = pickWinner(dailyParticipants);
...
}

function chooseWeekly() public {
   address weeklyWinner = pickWinner(weeklyParticipants);
...
}

 function __callback(
        bytes32 _queryId,
        string memory _result,
        bytes memory _proof
    )
        public
    {
        require(msg.sender == provable_cbAddress());

        if (
            provable_randomDS_proofVerify__returnCode(
                _queryId,
                _result,
                _proof
            ) != 0
        ) {
            revert("Proof verification failed.");
        } else {            
            randomNumber = uint256(keccak256(abi.encodePacked(_result)));
            emit generatedRandomNumber(randomNumber);
        }
    }

function pickWinner(Entry[] memory entries) internal returns(address) {

uint256 QUERY_EXECUTION_DELAY = 0;
        uint256 GAS_FOR_CALLBACK = 200000;
        provable_newRandomDSQuery(
            QUERY_EXECUTION_DELAY,
            entries.length,
            GAS_FOR_CALLBACK
        );
    
}
