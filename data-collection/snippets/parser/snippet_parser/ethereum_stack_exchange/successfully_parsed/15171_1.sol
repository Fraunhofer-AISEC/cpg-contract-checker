contract abc
{
    struct ABC {
        uint a;
        uint b;
        uint c;
    }

    ABC s;

    
    function s_pass() {
        s = ABC({a:1, b:2, c:3});
    }

    
    function s_frm_m_pass() {
        ABC memory m = ABC({a:1, b:2, c:3});
        s = m;
    }
}
