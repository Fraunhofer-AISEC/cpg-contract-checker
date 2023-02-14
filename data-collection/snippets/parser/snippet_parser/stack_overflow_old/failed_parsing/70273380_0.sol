**
pragma solidity ^0.8.7;
contract SmartRegistryData{
    struct TP {
        uint id;
    }
    struct OP {
        uint id;
    }
    struct BP{
        uint id;
    }
    
    struct CDMD {
            uint ID;
            address providerAdress;
            TP TechnicalPerspective;
            OP OperationalPerspective;
            BP BusnissPerspective;
        } 
        mapping(uint => CDMD) public CDMDS;
        mapping(address => CDMD) public CDMDSA;
    
    struct PROVIDER{
        uint8 id;
        string name;
        address publicAddress;
        string entrepriseName;
        string entreprisedomain;
        string entreprisedescription;
    }
    
    mapping( address  => PROVIDER) public _listproviders;


    function retreiveCDMDbyProvider(address _publicAddress, address publicAddress)public{
        CDMD [] memory CDMDarray = new CDMD[](100);
       
        CDMD storage  cdmd = CDMDSA[_publicAddress];
        if(CDMDSA[_publicAddress].providerAdress== publicAddress){
            CDMD memory cdma = CDMDSA[_publicAddress];
           
        }
    }
}**
