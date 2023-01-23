
import "./BindingTemplate.sol";
import "./EnumsLibrary.sol";
contract BindingManager { 
    string[] private templateList; 
    mapping(string => BindingTemplate) private templates; 
  
   function makeTemplate(
        string memory bindingName,
    ) public   {      
        BindingTemplate myTemplate = new BindingTemplate(bindingName); 
        templates[bindingName] = myTemplate;
    }
  
    function getTemplate(string memory bindingName) public view returns(BindingTemplate) {
        string memory id = idMapping[bindingName];
        require(bytes(id)[0] != 0x0, "no such binding");
        return templates[id];
    }
 }
    
