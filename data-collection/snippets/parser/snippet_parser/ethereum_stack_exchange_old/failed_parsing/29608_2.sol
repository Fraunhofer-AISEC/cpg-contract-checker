function F() M() {
   a = 1;
}

modifier M() {
   if (a == 1) throw;
   _
}
