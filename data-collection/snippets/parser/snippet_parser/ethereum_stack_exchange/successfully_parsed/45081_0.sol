pragma solidity ^0.4.0;

import "./usingOraclize.sol";


contract Purchasing is usingOraclize {

    string[] public subIDsBought;
    uint256 public price;
    string public query1;
    string public query2;
    address public author;
    address public buyer;
    uint256 public sentValue;
    bool public lastTransactionWasValid = false;

    mapping (bytes32 => uint) queries;

    event newOraclizeQuery(string description);

    
    

    function Purchasing () public {
        OAR = OraclizeAddrResolverI(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475);
        oraclize_setNetwork(networkID_testnet);
    }

    function __callback(bytes32 myid, string result) {
            if (msg.sender != oraclize_cbAddress()) throw;


       if (queries[myid] == 1){
          author = parseAddr( result );

       } else{
           if(queries[myid] == 2){
                price = parseInt(result);

               
               if (sentValue >= price) {
                   
                   lastTransactionWasValid = true;
                   author.send(sentValue);
               } else {
                   
                   lastTransactionWasValid = false;
                   buyer.send(sentValue);
               }

           } 
       }
    }

    function purchaseLogo( string subID ) public payable returns (bool success) {

            buyer = msg.sender;

            query1 = strConcat("json(", "http:localhost:3000/api/getpurchasedata/", subID, ")", ".purchase.recipient");
            query2 = strConcat("json(", "http:localhost:3000/api/getpurchasedata/", subID, ")", ".purchase.price");

            newOraclizeQuery("Oraclize query was sent, standing by for the answer..");

            
            queries[oraclize_query("URL", query1)] = 1; 
            queries[oraclize_query("URL", query2)] = 2; 

            return     lastTransactionWasValid;
    }


    
    function strConcat(string _a, string _b, string _c, string _d, string _e) internal returns (string){
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        bytes memory _be = bytes(_e);
        string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
        bytes memory babcde = bytes(abcde);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
        for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
        for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
        for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
        for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
        return string(babcde);
    }

    function strConcat(string _a, string _b, string _c, string _d) internal returns (string) {
        return strConcat(_a, _b, _c, _d, "");
    }

    function strConcat(string _a, string _b, string _c) internal returns (string) {
        return strConcat(_a, _b, _c, "", "");
    }

    function strConcat(string _a, string _b) internal returns (string) {
        return strConcat(_a, _b, "", "", "");
    }

}
