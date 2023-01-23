function quickSortOffersBidsPrice(Lb.Lib.OfferBid[] memory arr, bool ascending) public view returns(Lb.Lib.OfferBid[] memory) {
        if(arr.length == 0) return arr;
        uint[] memory prices = lib.arr_of_prices_offerbids(arr);
        Lb.Lib.OfferBid[] memory sorted = get_indices_and_sort(prices,arr,ascending);
        return sorted;
    }
