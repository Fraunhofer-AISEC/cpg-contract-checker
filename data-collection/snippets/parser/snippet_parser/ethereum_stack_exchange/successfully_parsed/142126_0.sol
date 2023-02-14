    function issueCertificate(
    address _issuer, address _prover, string memory _status,
    uint meatBatchId, bytes memory signature) public returns (uint) {
        Entity memory issuer = entities[_issuer];
        require (issuer.mode == Mode.ISSUER);

        Entity memory prover = entities[_prover];
        require (prover.mode == Mode.PROVER);

        Status status = unmarshalStatus(_status);

        uint[] id = certificates.length;
        Certificate memory certificate = Certificate(id, issuer, prover, signature, status);

        certificateIds.push(certificateIds.length);
        certificates[certificateIds.length-1] = certificate;

        emit IssueCertificate(_issuer, _prover, certificateIds.length-1);

        return certificateIds.length-1;
    }
