function revokeAffiliate(address _addr) public onlyOwner returns(bool) {
    require(isAffiliate[_addr]);
    isAffiliate[_addr] = false;
    affiliateCodeToAddr[affiliateCodeOfAddr[_addr]] = address(0);
    emit AffiliatePartnershipRevoked(_addr, affiliateCodeOfAddr[_addr]);
    affiliateCodeOfAddr[_addr] = "No longer an affiliate partner";
    return true;
}
