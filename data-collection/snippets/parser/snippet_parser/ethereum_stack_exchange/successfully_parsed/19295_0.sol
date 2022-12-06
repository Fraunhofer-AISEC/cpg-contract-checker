pragma solidity ^0.4.6;

contract TestContract{
    string coaf;
    string choice;
    string info;
    string isin;
    string recordDate;
    string exDate;

    function TestContract(string _coaf, string _choice, string _info,string _isin,string _recordDate,string _exdate){
        coaf = _coaf;
        choice = _choice;
        info = _info;
        isin =_isin;
        recordDate=_recordDate;
        exDate=_exdate;
    }


    function getFields() constant returns(string, string, string,string,string,string){
        return(coaf,choice,info,isin,recordDate,exDate);

    }
   function SetFields(string _coaf,string _choice,string _info,string _isin,string _recordDate,string _exdate){
     coaf=_coaf;
     choice=_choice;
     info=_info;
     isin=_isin;
     recordDate=_recordDate;
     exDate=_exdate;
   }
    function setChoice(string _choice) {
        info = _choice;
    }

}
