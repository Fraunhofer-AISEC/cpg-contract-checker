function getVerifiedProposals(uint index) public returns (string[] memory, string[][] memory, address, uint[] memory) {
        string[][] storage tempDocuments;
        address tempAddresses;
        uint[] memory tempAmount;
        
        if (allBidderProposals[index].status == ProposalStatus.verified) { 
            tempDocuments.push(allBidderProposals[index].constraintDocuments);
            tempAddresses = allBidderProposals[index].bidderAddress;
            tempAmount = allBidderProposals[index].quotationAmount;
        }
        return (constraints, tempDocuments, tempAddresses, tempAmount);
    } 
