function get_indices_and_sort(uint[] memory values, Lb.Lib.OfferBid[] memory offers_bids, bool ascending) private pure returns(Lb.Lib.OfferBid[] memory) {
        uint[] memory indices = new uint[](values.length);
        for (uint z = 0; z < indices.length; z++) {
            indices[z] = z;
        }
        Sorting.quickSort_indices(values, 0, int(values.length-1), indices);
        if(!ascending){
            indices = reverseArray(indices);
        }
        Lb.Lib.OfferBid[] memory sorted = new Lb.Lib.OfferBid[](values.length);
        for (uint z = 0; z < indices.length; z++) {
            sorted[z] = offers_bids[indices[z]];
        }
        return sorted;
    }
