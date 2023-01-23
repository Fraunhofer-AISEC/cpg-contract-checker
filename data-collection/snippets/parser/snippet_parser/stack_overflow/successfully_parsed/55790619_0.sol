

  function getArticlesForSale() public view returns (uint[] memory) {
    
    uint[] memory articleIds = new uint[](articleCounter);

    uint numberOfArticlesForSale = 0;
    
    for (uint i = 1; i <= articleCounter; i++) {
      if (articles[i].buyer == address(0)) {
        articleIds[numberOfArticlesForSale] = articles[i].id;
        numberOfArticlesForSale++;
      }
    }

    
    uint[] memory forSale = new uint[](numberOfArticlesForSale);

    for (uint j = 0; j < numberOfArticlesForSale; j++) {
      forSale[j] = articleIds[j];
    }

    return forSale;
  }
