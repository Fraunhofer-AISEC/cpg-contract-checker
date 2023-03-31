contract ExecuteDiamondCuts {

    address CONTRACT_ADDRESS = 0xblahblah; 
    string[] functionsToRemove;

    constructor() {
        functionsToRemove.push("exampleFunctionA(address)");
        functionsToRemove.push("exampleFunctionB(uint)");
        functionsToRemove.push("exampleFunctionC()");
    }
    
    function cutSomeDiamonds() external {
        IDiamondLoupe _loupe = IDiamondLoupe(CONTRACT_ADDRESS);

        IDiamondCut.FacetCut[] memory _facetCuts = new IDiamondCut.FacetCut[](functionsToRemove.length);

        for (uint i=0; i<functionsToRemove.length; i++) {
            
            address facetWithFn = _loupe.facetAddress(bytes4(keccak256(bytes((functionsToRemove[i])))));
            bytes4[] memory _fnSelectors = new bytes4[](1);
            _fnSelectors[0] = bytes4(keccak256(bytes((functionsToRemove[i]))));

            IDiamondCut.FacetCut memory _facetCut = IDiamondCut.FacetCut({
                facetAddress: facetWithFn, 
                action: IDiamondCut.FacetCutAction.Remove, 
                functionSelectors: _fnSelectors 
            });
            _facetCuts[i] = _facetCut;
        }

        (bool success,) = CONTRACT_ADDRESS.delegatecall(
            abi.encodeWithSignature(
                "diamondCut(FacetCut[],address,bytes)", 
                _facetCuts,
                address(0),
                "0x"
            )
        );
        require(success);
    }
}
