
function setContractDetail(uint8 index,bool isConsentItem,uint8[] detailItems) public checkOwner{
    consentForm.items[index].isConsent= isConsentItem;
    consentForm.items[index].itemDetail = detailItems;
    
}
function setContractDetail2(uint8 index,bool isConsentItem) public checkOwner{
    consentForm.items[index].isConsent = isConsentItem;
}
function setContractDetail3(uint8[] index,bool isConsentItem,uint8[] detailItems) public checkOwner{
    for(uint i=0;i<index.length;i++){
        uint pointer = index[i];
        consentForm.items[pointer].isConsent= isConsentItem;
        consentForm.items[pointer].itemDetail = detailItems;
    }
    
}
function setContractDetail4(bool isTest,uint8[] index,bool isConsentItem,uint8[] detailItems) public checkOwner{
    for(uint i=0;i<index.length;i++){
        uint pointer = index[i];
        consentForm.items[pointer].isConsent= isConsentItem;
        consentForm.items[pointer].itemDetail = detailItems;
    }
    
}
