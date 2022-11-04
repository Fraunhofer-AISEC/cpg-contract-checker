function getPosts(address[] subscriptions, uint[] subscriptionIndexes, uint count) public view returns 
            (address[], bytes32[], bytes32[], uint[]) {

            address[] storage postSenders;
            bytes32[] storage postLinks;
            bytes32[] storage postComments;
            uint[] storage postTimestamps;

            while(postSenders.length < count) {
                (uint postId, address subscription) = getNextPost(subscriptions, subscriptionIndexes);


                postSenders.push(subscription);
                postLinks.push(addressToLinks[subscription][postId]);
                postComments.push(addressToComments[subscription][postId]);
                postTimestamps.push(addressToTimestamps[subscription][postId]);
            }

            return (postSenders, postLinks, postComments, subscriptionIndexes);
        }
