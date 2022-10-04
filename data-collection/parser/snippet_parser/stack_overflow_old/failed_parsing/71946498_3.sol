call(g, a, v, in, insize, out, outsize)

call contract at address a with input mem[in…(in+insize)) providing g gas and v wei and output area mem[out…(out+outsize)) returning 0 on error (eg. out of gas) and 1 on success See more


callcode(g, a, v, in, insize, out, outsize)

identical to call but only use the code from a and stay in the context of the current contract otherwise See more


delegatecall(g, a, in, insize, out, outsize)

identical to callcode but also keep caller and callvalue See more


staticcall(g, a, in, insize, out, outsize)

identical to call(g, a, 0, in, insize, out, outsize) but do not allow state modifications See more
