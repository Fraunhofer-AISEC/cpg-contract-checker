function strcompare(string p_source,string p_target) external returns(bool) {
    bytes memory lbt_left;
    bytes memory lbt_right;            
    lbt_left = bytes(p_source);
    lbt_right = bytes(p_target);
    bool lb_equal = true;
    uint li_length = lbt_right.length;
    for( uint p = 0 ;p < li_length;p++){
        if (lbt_left[p] == lbt_right[p] ) {
            continue;
        } else {
            lb_equal = false;
            break;
        }
    }
    return lb_equal;
}
