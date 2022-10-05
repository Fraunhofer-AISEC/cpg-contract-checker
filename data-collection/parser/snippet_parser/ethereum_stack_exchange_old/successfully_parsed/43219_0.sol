function insert(Index storage index,uint value) {
    if(index.numberofInserts==0){
     

    }
     index.numberofInserts+=1;
    if (value==0){
        index.nodes[value].dupes++;
    }
    else{
        insert_helper(index,0,true,value);
    }
}
function insert_helper(Index storage index,uint p_value,bool side,uint value) private {
    Node root=index.nodes[p_value];
    uint c_value=root.children[side];
    if (c_value==0){
        root.children[side]=value;
        Node child=index.nodes[value];
        child.parent=p_value;
        child.side=side;
        child.height=1;
        child.count=1;
        update_counts(index,value);
        rebalance_insert(index,value);
    }
    else if (c_value==value){
        index.nodes[c_value].dupes++;
        update_count(index,value);
        update_counts(index,value);
    }
    else{
        bool side_new=(value >= c_value);
        insert_helper(index,c_value,side_new,value);
    }
}
