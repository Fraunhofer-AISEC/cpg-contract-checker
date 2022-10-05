pragma solidity 0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";


contract AdvancedCollectible is ERC721 {

    bytes32 internal keyHash;
    uint256 public fee;
    event requestedCollectible(address indexed senderAdd);

    uint256 public tokenCounter;

    struct Remedio { 
      string nome_medicamento;
      uint256 dosagem;
      string farmaceutica;
      string posologia;
   }   


    enum Breed{PUG, SHIBA_INU, ST_BERNARD}
    mapping(uint256 => address) public requestIdToSender;
    mapping(uint256 => Breed) public tokenIdToBreed;
    mapping(uint256 => Remedio) public tokenIdToRemedio;
    mapping(uint256 => uint256) public requestIdToTokenId;

    

    constructor() public
        ERC721("GeradorReceitasMedicas", "Receita")
    {
        
        tokenCounter = 0;
    }

    

    function createCollectible(string memory nomeMedicamento, uint256 dosagem, string memory farmaceutica, string memory posologia) 
    public returns (bytes32) {
        
        uint256 newItemId = tokenCounter;

        tokenCounter = tokenCounter + 1;

        Remedio memory newRemedio = Remedio({
           nome_medicamento: nomeMedicamento,
           dosagem: dosagem,
           farmaceutica: farmaceutica,
           posologia: 'posologia'
        });

        requestIdToSender[newItemId] = msg.sender;
        address receitaOwner = requestIdToSender[newItemId];

        _safeMint(receitaOwner, newItemId);

        tokenIdToRemedio[newItemId] = newRemedio;

        emit requestedCollectible(receitaOwner);

    }
    
    

}
