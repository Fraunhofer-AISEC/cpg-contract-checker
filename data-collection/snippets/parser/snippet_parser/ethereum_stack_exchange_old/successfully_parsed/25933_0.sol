pragma solidity ^0.4.16;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";
import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract CFDBroker is usingOraclize {

   using strings for *;

   mapping (uint => uint) instruments;
   mapping (bytes32 => uint) queries;
   uint public GOLD;
   uint public EURUSD;
   uint public DJI;


   function sendFunds() payable {

       getData();

   }


   function __callback(bytes32 myid, string result, bytes proof) {

       require(msg.sender == oraclize_cbAddress());

       if (queries[myid] == 1){
           
           var s = result.toSlice();
           GOLD = parseInt(s.beyond("$".toSlice()).until("/".toSlice()).toString())*100;
           instruments[1] = GOLD;

       } else{
           if(queries[myid] == 2){
               
               s = result.toSlice();
               var r = result.toSlice().beyond(".".toSlice());
               EURUSD = parseInt(s.beyond("$".toSlice()).until(".".toSlice()).concat(r));
               instruments[2] = EURUSD;

           } else{
               if(queries[myid] == 3){
                   
                   DJI = parseInt(result)*100;
                   instruments[3]=DJI;

               }
           }
       }

       update();

       

   }

   
   function getData() private{

       queries[oraclize_query(50, "WolframAlpha","gold price in usd")] = 1; 
       queries[oraclize_query(50, "WolframAlpha","eur/usd")] = 2; 
       queries[oraclize_query(50, "WolframAlpha","DJI price")] = 3; 

   }}
