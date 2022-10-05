pragma solidity 0.5.14;

import "./HitchensUnorderedKeySet.sol";




library GraphLib {

    using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;

    struct EdgeStruct {
        bytes32 source;
        bytes32 target;
        uint weight;
    }

    struct NodeStruct {
        HitchensUnorderedKeySetLib.Set sourceEdgeSet; 
        HitchensUnorderedKeySetLib.Set targetEdgeSet; 
    }

    struct Graph {
        HitchensUnorderedKeySetLib.Set nodeSet;
        HitchensUnorderedKeySetLib.Set edgeSet;
        mapping(bytes32 => NodeStruct) nodeStructs;
        mapping(bytes32 => EdgeStruct) edgeStructs;
    }

    function insertNode(Graph storage g, bytes32 nodeId) internal {
        g.nodeSet.insert(nodeId);
    }

    function removeNode(Graph storage g, bytes32 nodeId) internal {
        NodeStruct storage n = g.nodeStructs[nodeId];
        require(n.sourceEdgeSet.count() == 0, "Graph: Remove source edges first.");
        require(n.targetEdgeSet.count() == 0, "Graph: Remove target edges first.");
        g.nodeSet.remove(nodeId);
        delete g.nodeStructs[nodeId];
    }

    function insertEdge(Graph storage g, bytes32 sourceId, bytes32 targetId, uint weight) internal returns(bytes32 edgeId) {
        require(g.nodeSet.exists(sourceId), "Graph: Unknown sourceId.");
        require(g.nodeSet.exists(targetId), "Graph: Unknown targetId.");
        edgeId = keccak256(abi.encodePacked(sourceId, targetId));
        EdgeStruct storage e = g.edgeStructs[edgeId];
        g.edgeSet.insert(edgeId);
        NodeStruct storage s = g.nodeStructs[sourceId];
        NodeStruct storage t = g.nodeStructs[targetId]; 
        s.targetEdgeSet.insert(edgeId);
        t.sourceEdgeSet.insert(edgeId);        
        e.source = sourceId;
        e.target = targetId;
        e.weight = weight;
    }

    function updateEdge(Graph storage g, bytes32 sourceId, bytes32 targetId, uint weight) internal {
        bytes32 edgeId = keccak256(abi.encodePacked(sourceId, targetId));
        require(g.edgeSet.exists(edgeId), "Graph: Unknown edge.");
        EdgeStruct storage e = g.edgeStructs[edgeId];
        e.weight = weight;
    }

    function removeEdge(Graph storage g, bytes32 sourceId, bytes32 targetId) internal {
        bytes32 edgeKey = keccak256(abi.encodePacked(sourceId, targetId));
        g.edgeSet.remove(edgeKey);
        delete g.edgeStructs[edgeKey];
        NodeStruct storage s = g.nodeStructs[sourceId];
        NodeStruct storage t = g.nodeStructs[targetId];
        s.targetEdgeSet.remove(edgeKey);
        t.sourceEdgeSet.remove(edgeKey);
    }

    function insertBetween(Graph storage g, bytes32 newNodeId, bytes32 sourceId, bytes32 targetId, uint sourceWeight, uint targetWeight) internal {
        removeEdge(g, sourceId, targetId);
        insertEdge(g, sourceId, newNodeId, sourceWeight);
        insertEdge(g, newNodeId, targetId, targetWeight);
    }  

    

    function edgeExists(Graph storage g, bytes32 edgeId) internal view returns(bool exists) {
        return(g.edgeSet.exists(edgeId));
    }

    function edgeCount(Graph storage g) internal view returns(uint count) {
        return g.edgeSet.count();
    }

    function edgeAtIndex(Graph storage g, uint index) internal view returns(bytes32 edgeId) {
        return g.edgeSet.keyAtIndex(index);
    }

    function edgeSource(Graph storage g, bytes32 edgeId) internal view returns(bytes32 sourceId, uint weight) {
        require(edgeExists(g, edgeId), "Graph: Unknown edge.");
        EdgeStruct storage e = g.edgeStructs[edgeId];
        return(e.source, e.weight);
    } 

    function edgeTarget(Graph storage g, bytes32 edgeId) internal view returns(bytes32 targetId, uint weight) {
        require(edgeExists(g, edgeId), "Graph: Unknown edge.");
        EdgeStruct storage e = g.edgeStructs[edgeId];
        return(e.target, e.weight);
    } 

    

    function nodeExists(Graph storage g, bytes32 nodeId) internal view returns(bool exists) {
        return(g.nodeSet.exists(nodeId));
    }

    function nodeCount(Graph storage g) internal view returns(uint count) {
        return g.nodeSet.count();
    }

    function node(Graph storage g, bytes32 nodeId) internal view returns(uint sourceCount, uint targetCount) {
        require(g.nodeSet.exists(nodeId), "Graph: Unknown node.");
        NodeStruct storage n = g.nodeStructs[nodeId];
        return(n.sourceEdgeSet.count(), n.targetEdgeSet.count());
    }

    function nodeSourceEdgeAtIndex(Graph storage g, bytes32 nodeId, uint index) internal view returns(bytes32 sourceEdge) {
        require(g.nodeSet.exists(nodeId), "Graph: Unknown node.");
        NodeStruct storage n = g.nodeStructs[nodeId];
        sourceEdge = n.sourceEdgeSet.keyAtIndex(index);
    }

    function nodeTargetEdgeAtIndex(Graph storage g, bytes32 nodeId, uint index) internal view returns(bytes32 targetEdge) {
        require(g.nodeSet.exists(nodeId), "Graph: Unknown node.");
        NodeStruct storage n = g.nodeStructs[nodeId];
        targetEdge = n.targetEdgeSet.keyAtIndex(index);
    }
}

import "./HitchensUnorderedAddressSet.sol";

contract GraphTest {

    using GraphLib for GraphLib.Graph;
    using HitchensUnorderedAddressSetLib for HitchensUnorderedAddressSetLib.Set;
    GraphLib.Graph userGraph;

    struct UserStruct {
        string name;
        
    }

    HitchensUnorderedAddressSetLib.Set userSet;
    mapping(address => UserStruct) private userStructs;

    function newUser(address userId, string memory name) public {
        userSet.insert(userId);
        userStructs[userId].name = name;
        userGraph.insertNode(toBytes32(userId));
    }

    function removeUser(address userId) public {
        userGraph.removeNode(toBytes32(userId)); 
        delete userStructs[userId];
        userSet.remove(userId);
    }

    function updateUser(address userId, string memory name) public {
        require(userSet.exists(userId), "GraphTest: Unknown user.");
        userStructs[userId].name = name;
    }

    function follow(address sourceId, address targetId, uint importance) public {
        require(userSet.exists(sourceId), "GraphTest: Unknown follower.");
        require(userSet.exists(targetId), "GraphTest: Unknown target.");
        userGraph.insertEdge(toBytes32(sourceId), toBytes32(targetId), importance);
    }

    function unfollow(address sourceId, address targetId) public {
        require(userSet.exists(sourceId), "GraphTest: Unknown follower.");
        require(userSet.exists(targetId), "GraphTest: Unknown target.");
        userGraph.removeEdge(toBytes32(sourceId), toBytes32(targetId));
    }

    function adjustFollow(address sourceId, address targetId, uint importance) public {
        userGraph.updateEdge(toBytes32(sourceId), toBytes32(targetId), importance);
    }

    

    function userCount() public view returns(uint count) {
        count = userSet.count();
    }

    function userAtIndex(uint index) public view returns(address userId) {
        userId = userSet.keyAtIndex(index);
    }

    function userInfo(address userId) public view returns(string memory name, uint followerCount, uint followingCount) {
        require(userSet.exists(userId), "GraphTest: Unknown user.");
        (followerCount, followingCount) = userGraph.node(toBytes32(userId));
        name = userStructs[userId].name;
    }

    function userFollowerAtIndex(address userId, uint index) public view returns(address followerId, uint importance) {
        require(userSet.exists(userId), "GraphTest: Unknown user.");
        bytes32 edgeId = userGraph.nodeSourceEdgeAtIndex(toBytes32(userId), index);
        (bytes32 source, uint weight) = userGraph.edgeSource(edgeId);
        importance = weight;
        followerId = toAddress(source);
    }

    function userFollowingAtIndex(address userId, uint index) public view returns(address followingId, uint importance) {
        require(userSet.exists(userId), "GraphTest: Unknown user.");
        bytes32 edgeId = userGraph.nodeTargetEdgeAtIndex(toBytes32(userId), index);
        (bytes32 target, uint weight) = userGraph.edgeTarget(edgeId);
        importance = weight;
        followingId = toAddress(target);
    }

    

    

    

    function toBytes32(address a) private pure returns(bytes32) {
        return bytes32(uint(uint160(a)));
    }

    function toAddress(bytes32 b) private pure returns(address) {
        return address(uint160(uint(b)));
    }
}
