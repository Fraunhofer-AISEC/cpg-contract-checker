uint private constant MAGIC = ...; 
uint private magic = MAGIC;

function isDelegated () internal view return (bool) {
  return magic != MAGIC;
}
