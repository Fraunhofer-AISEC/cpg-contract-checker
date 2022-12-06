pragma solidity ^0.4.21;

import 'github.com/chrisdotn/jsmnSol/contracts/JsmnSolLib.sol';

contract MusicalContract {

    struct parameters {
        string name;
        string mr_share;
        string pr_share;
        string sr_share;
        string country;
        string walletDir;
    }

    
    

    parameters[] public params;

    string public json = '[{"name":"Martin","pr_share":"2","mr_share":"2","sr_share":"2","country":"2101","walletDir":"12345"},{"name":"Ahoj","share":"","walletDir":"2589","pr_share":"2","mr_share":"2","sr_share":"2","country":"36"},{"name":"Cus","share":"","walletDir":"12345","pr_share":"2","mr_share":"3","sr_share":"1","country":"2100"}]';

    

    function MusCo() public {
        uint returnValue;
        uint actualNum;
        JsmnSolLib.Token[] memory tokens;
        string memory jsonElement;
        JsmnSolLib.Token memory t;

        (returnValue, tokens, actualNum) = JsmnSolLib.parse(json, 200);

        for(uint ielement=0; ielement < actualNum-1; ielement++) {
            t = tokens[ielement];
            jsonElement = JsmnSolLib.getBytes(json, t.start, t.end);
            
            
            if(compareStrings(jsonElement, "name")) {
                t = tokens[ielement+1];
                params[ielement].name = JsmnSolLib.getBytes(json, t.start, t.end);
            } else if(compareStrings(jsonElement, "pr_share")) {
                t = tokens[ielement+1];
                params[ielement].pr_share = JsmnSolLib.getBytes(json, t.start, t.end);
            } else if(compareStrings(jsonElement, "mr_share")) {
                t = tokens[ielement+1];
                params[ielement].mr_share = JsmnSolLib.getBytes(json, t.start, t.end);
            } else if(compareStrings(jsonElement, "sr_share")) {
                t = tokens[ielement+1];
                params[ielement].sr_share = JsmnSolLib.getBytes(json, t.start, t.end);
            } else if(compareStrings(jsonElement, "country")) {
                t = tokens[ielement+1];
                params[ielement].country = JsmnSolLib.getBytes(json, t.start, t.end);
            } else if(compareStrings(jsonElement, "walletDir")) {
                t = tokens[ielement+1];
                params[ielement].walletDir = JsmnSolLib.getBytes(json, t.start, t.end);
            }
        }
    }

    function compareStrings (string a, string b) view returns (bool){
       return keccak256(a) == keccak256(b);    }

    function getContractAddress() public view returns (address) {
        return this;
    } }
