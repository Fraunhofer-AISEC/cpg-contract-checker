      import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
      
      contract Square is ERC721 {
        
        constructor() ERC721("Square", "SQUARE") public {}
        
        string[] public squares;
        mapping (address => uint) public ownerSquareCount;
            
        function mint(string memory _colour) public {
    
          
          require(ownerSquareCount[msg.sender] == 0, 'Each address may only own one square');
          
          squares.push(_colour);
          uint id = squares.length;
          ownerSquareCount[msg.sender]++;
          
          
          _safeMint(msg.sender, id);
               
          }
      }
