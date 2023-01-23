pragma solidity ^0.6.0;


contract ZeroKnowledge {
    
    ProvingKey public provingKey;
    
    Verifier public verifier;

    
    constructor(ProvingKey _provingKey, Verifier _verifier) public {
        provingKey = _provingKey;
        verifier = _verifier;
    }

    
    function submitProof(uint[] memory proof) public {
        require(verifier.verifyProof(proof, provingKey.pk()));
        
    }
}
