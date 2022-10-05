pragma solidity >0.8.3;

contract WateringHoles {

    struct Post {
        address payable poster;
        string datePosted;
        string content;
        uint gallons;
    }

    struct WateringHole {
        string localGroup;
        string majorGroup;
        string superiorGroup;
        uint lastPostBlockTimestamp;
    }
    
    WateringHole[] public __WateringHoles;

    WateringHole[] public __ActiveWateringHoles;

    Post[][] public __posts;

    uint public __postsSubmitted;
    uint public __commentsSubmitted;

    constructor() {
        __commentsSubmitted = 0;
        __postsSubmitted = 0;
    }

    function getActiveWateringHoles() public returns (WateringHole[] memory) {
        purgeInactiveWateringHoles();

        return __ActiveWateringHoles;
    }

    function getWateringHolePosts(string memory localGroup, string memory majorGroup, string memory superiorGroup) public view returns (Post[] memory) {
        uint indexOfWateringHole = uint(findWateringHole(localGroup, majorGroup, superiorGroup));

        return __posts[indexOfWateringHole];
    }

    function getPostComments(address payable poster, string memory datePosted, string memory content, string memory localGroup, string memory majorGroup, string memory superiorGroup) public view returns (Post[] memory) {
        uint indexOfWateringHole = uint(findWateringHole(localGroup, majorGroup, superiorGroup));
        uint indexOfPost = uint(findPost(poster, datePosted, content,localGroup, majorGroup, superiorGroup));
        Post[] memory temp  = __posts[indexOfWateringHole][indexOfPost];
        return __posts[indexOfWateringHole][indexOfPost];
    }

    function purgeInactiveWateringHoles() private {
        for(uint i = 0; i < __ActiveWateringHoles.length; i++) {
            if(block.timestamp - __ActiveWateringHoles[i].lastPostBlockTimestamp >= 86400) {
                delete __ActiveWateringHoles[i];

                for (uint x = i; i < __ActiveWateringHoles.length-1; x++){
                    __ActiveWateringHoles[x] = __ActiveWateringHoles[x+1];
                }

                delete __ActiveWateringHoles[__ActiveWateringHoles.length-1];
            }
        }
    }

    function addWateringHole(string memory localGroup, string memory majorGroup, string memory superiorGroup) private {
        WateringHole storage temp = WateringHole(localGroup, majorGroup, superiorGroup, block.timestamp);

        __WateringHoles.push(temp);
        __ActiveWateringHoles.push(temp);
    }

    function addPost(address payable poster, string memory datePosted, string memory content, string memory localGroup, string memory majorGroup, string memory superiorGroup) public returns (bool) {
        int indexOfWateringHole = findWateringHole(localGroup, majorGroup, superiorGroup);

        if(indexOfWateringHole < 0) {
            addWateringHole(localGroup, majorGroup, superiorGroup);

            indexOfWateringHole = int(__WateringHoles.length - 1);

            __posts[uint(indexOfWateringHole)].push(Post(poster, datePosted, content, 0));
            __WateringHoles[uint(indexOfWateringHole)].lastPostBlockTimestamp = block.timestamp;

            __postsSubmitted++;

            return true;
        } else {
            __posts[uint(indexOfWateringHole)].push(Post(poster, datePosted, content, 0));
            __WateringHoles[uint(indexOfWateringHole)].lastPostBlockTimestamp = block.timestamp;
            
            __postsSubmitted++;

            if(!isActiveWateringHole(localGroup, majorGroup, superiorGroup)) {
                __ActiveWateringHoles.push(__WateringHoles[uint(indexOfWateringHole)]);
            }

            return true;
        }
    }

     function addComment(address payable poster, string memory datePosted, string memory content, string memory localGroup, string memory majorGroup, string memory superiorGroup) public returns (bool) {
        int indexOfWateringHole = findWateringHole(localGroup, majorGroup, superiorGroup);
        int indexOfPost = int(findPost(poster, datePosted, content));

        if(indexOfWateringHole < 0) {
            return false;
        } else {
            __posts[uint(indexOfWateringHole)][uint(indexOfPost)].push(Post(poster, datePosted, content, 0));
            __WateringHoles[uint(indexOfWateringHole)].lastPostBlockTimestamp = block.timestamp;

            __commentsSubmitted++;

            if(!isActiveWateringHole(localGroup, majorGroup, superiorGroup)) {
                __ActiveWateringHoles.push(__WateringHoles[uint(indexOfWateringHole)]);
            }

            return true;
        }
    }

    function findWateringHole(string memory localGroup, string memory majorGroup, string memory superiorGroup) private view returns (int) {
        bool found = false;
        int indexOfWateringHole;
        
        for(uint i = 0; i < __WateringHoles.length - 1; i++) {
            if(compareStrings(localGroup, __WateringHoles[i].localGroup) && compareStrings(majorGroup, __WateringHoles[i].majorGroup) && compareStrings(superiorGroup, __WateringHoles[i].superiorGroup)) {
                found = true;
                indexOfWateringHole = int(i);
                break;
            }
        }

        if(found) {
            return indexOfWateringHole;
        } else {
            return -1;
        }
    }

    function isActiveWateringHole (string memory localGroup, string memory majorGroup, string memory superiorGroup) private view returns (bool) {
        for(uint i = 0; i < __ActiveWateringHoles.length - 1; i++) {
            if(compareStrings(localGroup, __ActiveWateringHoles[i].localGroup) && compareStrings(majorGroup, __ActiveWateringHoles[i].majorGroup) && compareStrings(superiorGroup, __ActiveWateringHoles[i].superiorGroup)) {
                return true;
            }
        }

        return false;
    }

    function findPost(address payable poster, string memory datePosted, string memory content, string memory localGroup, string memory majorGroup, string memory superiorGroup) private view returns (int) {
        int indexOfWateringHole = findWateringHole(localGroup, majorGroup, superiorGroup);
        bool found = false;
        int indexOfOP;
        
        for(uint i = 0; i < __postsSubmitted - 1; i++) {
            if(poster == __posts[indexOfWateringHole].poster && compareStrings(datePosted, __posts[indexOfWateringHole].datePosted) && compareStrings(content, __posts[indexOfWateringHole].content)) {
                found = true;
                indexOfOP = int(i);
                break;
            }
        }

        if(found) {
            return indexOfOP;
        } else {
            return -1;
        }
    }

    function compareStrings(string memory a, string memory b) private pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
}
