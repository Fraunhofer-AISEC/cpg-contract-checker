pragma solidity ^0.4.19;

contract Kata {
  function solution(uint n) returns (string) {
    
    uint len = Length(n);
    string[] numerals = Numerals(n);
    
    string roman = '';
    for (i=0; i<len; i++) {
      roman = Concatenate(roman, numerals[i]);
    return roman;
    }
  }
  
  function Length(uint x) returns(uint) {
    uint l = 0;
    while (x>0) {
      x / 10;
      l ++;
    }
    return l;
  }
    
  function Digits(uint x) returns(uint[]) {
    uint l = Length(x);
    uint d;
    uint[] ds;
      
    for (i=0; i<l; i++) {
      d = x / (10**(l-i-1));
      ds.push(d);
      x -= (d*(10**(l-i-1)));
    }
    return ds;
  }
      
  function Numerals(uint x) returns(string[]) {
    uint l = Length(x);
    uint[] ds = Digits(x);
    string[] s;
        
    mapping(uint => string) units;
    units[0] = "";
    units[1] = "I";
    units[2] = "II";
    units[3] = "III";
    units[4] = "IV";
    units[5] = "V";
    units[6] = "VI";
    units[7] = "VII";
    units[8] = "VIII";
    units[9] = "IX";
    
    mapping(uint => string) tens;
    tens[0] = "";
    tens[1] = "X";
    tens[2] = "XX";
    tens[3] = "XXX";
    tens[4] = "XL";
    tens[5] = "L";
    tens[6] = "LX";
    tens[7] = "LXX";
    tens[8] = "LXXX";
    tens[9] = "XC";
    
    mapping(uint => string) hundreds;
    hundreds[0] = "";
    hundreds[1] = "C";
    hundreds[2] = "CC";
    hundreds[3] = "CCC";
    hundreds[4] = "CD";
    hundreds[5] = "D";
    hundreds[6] = "DC";
    hundreds[7] = "DCC";
    hundreds[8] = "DCCC";
    hundreds[9] = "CM";
    
    mapping(uint => string) thousands;
    thousands[0] = "";
    thousands[1] = "M";
    thousands[2] = "MM";
    thousands[3] = "MMM";
       
    enum d {thousands, hundreds, tens, units}
          
    for (i=0; i<l, i++) {
      s.push(d(4-l+i)[ds[i]]);
    }
    return s;
  }
        
  function Concatenate(string a, string b) returns(string) {
    a_ = byte(a);
    b_ = byte(b);
    a_ *= (2**(b_.length));
    a_ += b_;
    return string(a_);
  }
}
