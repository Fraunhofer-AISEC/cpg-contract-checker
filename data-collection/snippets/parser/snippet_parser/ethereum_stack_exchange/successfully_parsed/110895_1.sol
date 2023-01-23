
pragma solidity 0.8.6;

import "./BKopyStrings.sol";
import "./9_BindingTemplate.sol";
import "./10_BindingManager.sol";
import "./BKopyAccessControl.sol";
import "./BKopyLite.sol";
import "./EnumsLibrary.sol";

 
contract BKopyRoot  {

    struct PriceList {
        uint32 publishPriceLite;
        uint32 mintPriceLite;
        uint32 transferPriceLite;
        uint32 royaltyTransferBasisPts;
    }
    
    BKAccessControl private secure;
    address private bindingManager;
    address public immutable rootOwner;  
    address public immutable rootAddress;
    PriceList private priceList;
    uint private _feesReceived;

    constructor(address failSafeAddr) {
        rootOwner = msg.sender;
        rootAddress = address(this);
        secure = new BKAccessControl(msg.sender, failSafeAddr );
        bindingManager = address(new BindingManager());
        priceList.mintPriceLite = 350000;
        priceList.publishPriceLite = 7000000;
        priceList.transferPriceLite = 175000;
        priceList.royaltyTransferBasisPts = 350;
    }

    modifier onlyBindingManager {
        bool qualified = secure.isSenderInRole(Role.BindingManagerRole);
        require(qualified, "nsf BM");
        _;
    }

    modifier onlyFinanceManager {
        bool qualified = secure.isSenderInRole(Role.FinanceManagerRole);
        require(qualified, "nsf FM");
        _;
    }
    
     using BKopyStrings for string;

     function ownerAddress() public view returns(address) {
         return rootOwner;
     }     

    function makeTemplate(TemplateFactoryMeta memory factoryMeta) public onlyBindingManager {
      
        TemplateMeta memory tempMeta = factoryMeta.templateMeta;       
        string memory bindingName = tempMeta.bindingName;
        BindingManager(bindingManager).makeTemplate(tempMeta.bindingName, 
                     tempMeta.templateText,
                     tempMeta.plainText,
                     tempMeta.bindingType
                     );        

        for(uint i=0; i<factoryMeta.paramsMeta.length; i++) {
            ParamMeta memory p = factoryMeta.paramsMeta[i];
            BindingManager(bindingManager).addBindingParameter(
                tempMeta.bindingName,
                p.name,
                p.isNumeric
            );
            if (!p.required) {
                BindingManager(bindingManager).markParamOptionalForBinding(
                    tempMeta.bindingName,
                    p.name
                );
            }
        }
       BindingManager(bindingManager).publish(bindingName);
    }

    function getBindingNameList() public view returns(string[] memory) {
       return BindingManager(bindingManager).getBindingNameList();
    }
    function getBindingText(string memory bindingName) public view returns(string memory) {
       return BindingManager(bindingManager).getTemplate(bindingName).templateText();
    }
 
    function createContract(BKLiteMeta memory meta)         
          public 
          payable
          returns(address) 
    {
        require(meta.publisherAddress == msg.sender, "only pub");
        return(address(new BKopyLite(meta)));
    }
  
    function setPricingStruct(PriceList memory newPricing) public onlyFinanceManager {
        priceList = newPricing;
    }
    function getPriceList() public view returns(PriceList memory) {
        return priceList;
    }
    function payFee() public payable {       
        _feesReceived += msg.value;  
    }
    function getBindingManager() public view returns(address) {
        return address(bindingManager);
    }
}