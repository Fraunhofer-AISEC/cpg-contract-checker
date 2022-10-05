function createCertificate(string title, string data, string url, address owner) public returns (uint certificateID, uint licenseID, uint assetID) {
    assetID = generateAssetID(data);
    AssetIDS.push(assetID);
    certificateID = generateCertificateID(assetID, owner);
    Certificate memory certificate = Certificate(Certificates.length, certificateID, assetID, 0, url, title, owner, owner, new address[](0), true);
    uint index = Certificates.push(certificate)-1;
    CIDtoIndex[certificateID] = index;
    Certificates[index].ownershipHistory.push(owner);
    
    licenseID = createLicense(certificate.index, certificateID, owner, owner);
    
    NFCProtocols.mint(owner, certificateID);
    emit ReturnNewCertificate(certificate.index, certificate.certificateID, msg.sender, Certificates[certificate.index].ownershipHistory);
}

function checkTokenStatus(uint certificateID) public {
    bool status = NFCProtocols.exists(certificateID);
    emit ReturnStatus(status, certificateID);
}
