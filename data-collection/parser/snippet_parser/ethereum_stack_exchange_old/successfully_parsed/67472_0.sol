uint256 private constant decimalFactor = 10**uint256(18);
enum AllocationType { PRESALE, ADVISOR, FOUNDER, AIRDROP, RESERVE, BONUS1, BONUS2, BONUS3 }

uint256 public constant INITIAL_SUPPLY = 10000000 * decimalFactor;
uint256 public AVAILABLE_TOTAL_SUPPLY = 10000000 * decimalFactor;
uint256 public AVAILABLE_PRESALE_SUPPLY = 30000 * decimalFactor;
uint256 public AVAILABLE_FOUNDER_SUPPLY = 50000 * decimalFactor;
uint256 public AVAILABLE_AIRDROP_SUPPLY = 10000 * decimalFactor;
uint256 public AVAILABLE_ADVISOR_SUPPLY = 20000 * decimalFactor;
uint256 public AVAILABLE_RESERVE_SUPPLY = 2375435 * decimalFactor;
uint256 public AVAILABLE_BONUS1_SUPPLY = 78546 * decimalFactor;
uint256 public AVAILABLE_BONUS2_SUPPLY = 47586 * decimalFactor;
uint256 public AVAILABLE_BONUS3_SUPPLY = 8469840 * decimalFactor;
