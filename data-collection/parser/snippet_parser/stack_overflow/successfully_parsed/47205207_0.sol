pragma solidity ^0.4.15;

contract Forensics{

string public info;
string public ForensicsSpecName;
string public AdditionalInfo;
string public timedate;

    function getForensName(string name){
        ForensicsSpecName = name;
    }

    function getInfo(string Info){
        info = Info;
    }

    function getAdditionalInfo(string ainfo){
        AdditionalInfo = ainfo;
    }

    function getdatetime(string information){
        timedate = information;
    }
}
