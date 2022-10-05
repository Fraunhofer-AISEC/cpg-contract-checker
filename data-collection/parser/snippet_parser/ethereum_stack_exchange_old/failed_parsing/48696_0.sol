 pragma solidity ^0.4.XXX;

    import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

    contract ExampleContract is usingOraclize {

        uint public time;
        uint public delay;
        uint public desired_time; 
        event LogConstructorInitiated(string nextStep);
        event LogTimeUpdated(string time);
        event LogNewOraclizeQuery(string description);

        function ExampleContract() payable {
            LogConstructorInitiated("Constructor was initiated.");
            delay = 0;
            updateTime();
        }

        function __callback(bytes32 myid, string result) {
            if (msg.sender != oraclize_cbAddress()) revert();
            time = parseInt(result,0);
            LogTimeUpdated(result);
            if(time < desiredtime)
              delay= desiredtime - time;
                updateTime();
            else if(time == desiredtime || time > desiredtime){
                
            }

        }

        function updateTime() payable {
            if (oraclize_getTime("URL") > this.balance) {
                LogNewOraclizeQuery("Oraclize query was NOT sent, please add some 
                ETH to cover for the query fee");
            } else {
                LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer..");
                oraclize_query(delay, "URL", "xml or json(parsing of the xml or json").parse.parse....;

            }
        }
    }
