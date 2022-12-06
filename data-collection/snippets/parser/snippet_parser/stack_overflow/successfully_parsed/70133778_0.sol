pragma solidity ^0.8.7;
interface UDL_SC_lifecycle_manager  {
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
       function PublishDesc(CDMD memory ContractDescription, address provider) external ;
       function UpdateDesc(CDMD memory ContractDescription, address provider) external ;
       function DestroyDesc(address contractadr, uint contractID) external returns(bool);

    }
        

    abstract contract SmartRegistryService is UDL_SC_lifecycle_manager{
        
        mapping(address => CDMD) CDMDS;
        address contractAdresse;
        address proprietaire;
        event DescriptionPublished(string _msg);
        event DescriptionUpdated (string _msg);
        event NotExist (string _msg);
        event Deleted (string _msg);
        
  
    
    function publishdesc (CDMD memory NVContractDescriptionMetaData, address providerAdress) public {
        CDMDS[providerAdress] = NVContractDescriptionMetaData;
        emit DescriptionPublished(" smart contract published successfully!");
    }
    
    modifier ProviderOnly(address provider){
            require(msg.sender == provider);
            _;
    }

    function updatedesc (CDMD memory NVContractDescriptionMetaData, address providerAddress, uint contractID) public {
            bool statue = false;
            CDMD storage newContractDescriptionMetaData = CDMDS[providerAddress];
            if((newContractDescriptionMetaData.ID== contractID)&&(newContractDescriptionMetaData.providerAdress == providerAddress)){
            statue = true;
            CDMDS[providerAddress] = NVContractDescriptionMetaData;
            emit DescriptionUpdated("smart contract updated successfully!");
            }else{
                 emit NotExist("smart contract notExist!");
            }
           
    }

    function destroydesc(address providerAddress, uint contractID) public {
        CDMD storage newContractDescriptionMetaData = CDMDS[providerAddress];
            if (newContractDescriptionMetaData.ID == contractID) {
                delete CDMDS[providerAddress];
                emit Deleted("smart contract deleted successfully!");
            }
    }
}
