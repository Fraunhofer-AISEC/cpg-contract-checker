contract ExampleProject is ERC1155 {
    uint256 public constant ROWA = 0;
    uint256 public constant ROWBA = 30;

    constructor() public ERC1155("ipfs://Example/metadata/{id}.json") {

    }
        function mintRowA() 
            public 

             {
               uint256[] memory a = new uint256[](2);
               a[0] = ROWA;
               a[1] = ROWBA;

               uint256[] memory b = new uint256[](2);
               b[0] = 1;
               b[1] = 1;

                _mintBatch(msg.sender, a, b, "" );
        }

        function mintSingle()
        public
            {
                _mint(msg.sender, ROWBA, 1, "");
            }
}
