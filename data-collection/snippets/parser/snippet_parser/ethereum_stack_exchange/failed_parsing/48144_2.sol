t=contract_name.at("address_of_c");
t.stringCmp.call(t.p(),t.q()) --> true (and it seems ok but..)
t.stringCmp.call(t.p(),t.r()) --> true (So what..???)
t.stringCmp.call(t.p,t.r) --> true (???)
t.stringCmp.call(t.p.call(),t.q.call()) --> Invalid number of arguments to Solidity function
