        bytes memory data; 

        bytes memory offer;

        assembly {
            offer := mload(add(offer,162))
        }
        
        address denomination;
        uint principal;
        uint repaymentWithFee;
        address collection;
        uint nft_id;
        address referrer;
        uint32 duration;
        uint16 adminFee_bps;
        
        assembly { 
            denomination := mload(add(offer,20))
            principal := mload(add(offer,52))
            repaymentWithFee := mload(add(offer,84))
            collection := mload(add(offer,104))
            nft_id := mload(add(offer,136))
            referrer := mload(add(offer,156))
            duration := mload(add(offer,160))
            adminFee_bps := mload(add(offer,162))
        }
