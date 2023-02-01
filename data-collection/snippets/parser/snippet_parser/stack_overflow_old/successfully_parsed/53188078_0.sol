pragma experimental "v0.5.0";
pragma experimental ABIEncoderV2;

contract StructContract {

    struct Certificate{
        uint id;
        string data;
    }

    struct StructEvent {
        string _from;
        string _to;
        string _object;
        string[] _rules;
    }

    StructEvent structEvent;
    Certificate[] certificate;

    function setEvent(StructEvent eventS,Certificate[] eventC)  public{
            certificate.length=0;
            structEvent = eventS;
            for(uint i=0;i<(eventC.length);i++){
              certificate.push(Certificate(eventC[i].id,eventC[i].data));
            }
    }
    function getStruct() view public returns(StructEvent){
        return(structEvent);
    }
    function getCertificate() view public returns(Certificate[]){
        return(certificate);
    }
    function returnAllData() view public returns(StructEvent,Certificate[]){
        return(structEvent,certificate);
    }

}
