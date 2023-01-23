for (uint i = 0; i < idList.length; i++) {
        Contract storage k = contracts[idList[i]];
          k.vintage += 1;
      }
