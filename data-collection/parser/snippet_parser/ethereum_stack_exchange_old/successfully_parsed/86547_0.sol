
pragma solidity 0.7.0;


library IntervalTree {
    struct Interval {
        uint a;
        uint b;
    }
    
    struct Node {
        Interval i;
        address addr;
    
        uint max;
        
        
        uint left;
        uint right;
    }
    
    
    
    struct Tree {
        Node[] nodes;
    }

    
    function add(Tree storage tree, uint a, uint b, address addr) public {
        tree.nodes.push(Node({
            i: Interval({a: a, b: b}),
            max: b,
            left: 0, right: 0,
            addr: addr
        }));
        
        fix(tree, tree.nodes[0], tree.nodes.length-1, a, b);
    }
    
    function max(uint a, uint b) private pure returns(uint) {
        if (a > b)
            return a;
        
        return b;
    }
    
    
    function fix(Tree storage tree, Node storage node, uint nid, uint a, uint b) private {
        node.max = max(node.max, b);

        if (a < node.i.a) {
            if (node.left != 0) {
                fix(tree, tree.nodes[node.left], nid, a, b);
                return;
            }

            node.left = nid;
        } else {
            if (node.right != 0) {
                fix(tree, tree.nodes[node.right], nid, a, b);
                return;
            }

            node.right = nid;
        }
    }
    
    
    function contains(Interval storage i, uint v) private view returns(bool) {
        return (i.a <= v && v <= i.b);
    }

    
    
    function search(Tree storage tree, uint v, Node[] storage nodes) public {
        searchIntervals(tree, 0, v, nodes);
    }
    
    
    function searchIntervals(Tree storage tree, uint i, uint v, Node[] storage nodes) private {
        if (contains(tree.nodes[i].i, v)) {
            nodes.push(tree.nodes[i]);
        }

        if (tree.nodes[i].left != 0 && tree.nodes[tree.nodes[i].left].max >= v) {
            searchIntervals(tree, tree.nodes[i].left, v, nodes);
        }
        
        if (tree.nodes[i].right != 0 && tree.nodes[tree.nodes[i].right].max >= v) {
            searchIntervals(tree, tree.nodes[i].right, v, nodes);
        }
    }
    
    function length(Tree storage tree) public view returns(uint) {
        return tree.nodes.length;
    }
}
