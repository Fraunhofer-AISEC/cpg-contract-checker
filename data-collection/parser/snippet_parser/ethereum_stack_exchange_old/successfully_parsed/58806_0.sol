function test(uint[400] subscriptions, uint[400] subscriptionIndexes) public view returns 
      (uint[4000], uint[4000], uint[400]) {

        uint[4000] memory postSenders;
        uint[4000] memory postIds;

        for (uint i = 0; i < 4000; i++) {

            postSenders[i] = 1;
            postIds[i] = 1;
        }

        return (postSenders, postIds, subscriptionIndexes);
    }
