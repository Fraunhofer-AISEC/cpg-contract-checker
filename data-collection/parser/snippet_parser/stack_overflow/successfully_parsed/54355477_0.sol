function quickSort(uint[qntNumbers] memory tab, uint left, uint right) private {
    uint i = left;
    uint j = right;
    uint mid = tab[left + (right - left) / 2];
    while (i <= j) {
        while (tab[i] < mid) i++;
        while (mid < tab[j]) j--;
        if (i <= j) {
            (tab[i], tab[j]) = (tab[j], tab[i]);
            i++;
            j--;
        }
    }
    if (left < j)
        quickSort(tab, left, j);
    if (i < right)
        quickSort(tab, i, right);

}
