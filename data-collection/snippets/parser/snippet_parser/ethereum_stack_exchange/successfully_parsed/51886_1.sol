pragma solidity ^0.4.0;
import "./oraclizeAPI_0.5.sol"; 

contract RandomOrg is usingOraclize {
    string public res;

    event Log(string text);

    function RandomOrg() {

        Log("Created!");
    }


    function __callback(bytes32 myId, string _result) {
        if (msg.sender != oraclize_cbAddress()) revert();


        res = _result; 
        Log(res);
        updateNumber();

    }

    function updateNumber() payable {
        string memory query = "https://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new";
        oraclize_query(0, "URL", query);
    }

}
