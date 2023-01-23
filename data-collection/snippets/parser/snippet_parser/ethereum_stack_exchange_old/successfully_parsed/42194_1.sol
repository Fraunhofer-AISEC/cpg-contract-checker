          contract verifySettlement is usingOraclize {

           uint public price;
           string public landingtime;
           string public expectedtime;`
           string public tempvalue;


            event Log(string text);

            enum oraclizeState { ForActual, ForExpected }

            struct oraclizeCallback {
                  oraclizeState oState;
            }
            mapping (bytes32 => oraclizeCallback) public oraclizeCallbacks;

          function verifySettlement() payable {
                   Log("Contract created.");
                   getActualFlightDetails();
                   getExpectedFlightDetails();
          }

          function getActualLandingHour() constant returns (string) {
                return landingtime;
          }

          function getExpectedLandingHour() constant returns (string) {
              return expectedtime;
            }

         function __callback(bytes32 _myid, string _result) {
                 require (msg.sender == oraclize_cbAddress());
                 oraclizeCallback memory o = oraclizeCallbacks[myid];
                 if (o.oState == oraclizeState.ForActual) {
                           Log("1111111111111111111111111");
                 }
                 else if(o.oState == oraclizeState.Forxpected) {
                       Log("2222222222222222222222222222222");   
                 }
         }

         function getActualFlightDetails() payable {
                   Log("Oraclize query was sent, waiting for the answer for getting actual flight details..");
                   bytes32 queryId=oraclize_query("URL","http://169.53.241.139:5000/actual/flight/1");
                   oraclizeCallbacks[queryId] = oraclizeCallback(oraclizeState.ForActual);
          }

         function getExpectedFlightDetails() payable {
                Log("Oraclize query was sent, waiting for the answer for getting actual flight details..");

                bytes32 queryId=oraclize_query("URL","http://169.53.241.139:5000/expected/flight/1");
              oraclizeCallbacks[queryId] = oraclizeCallback(oraclizeState.ForExpected);
         }
    }
