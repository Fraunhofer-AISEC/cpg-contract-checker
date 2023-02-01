call(g, a, v, in, insize, out, outsize)     

call contract at address a with input mem[in..(in+insize)) providing g gas 
and v wei and output area mem[out..(out+outsize))
returning 0 on error (eg. out of gas) and 1 on success
