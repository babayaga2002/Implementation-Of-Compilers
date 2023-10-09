int main()
{
    int temp;
    int n;
    int a[10];
    int m;
    int i;
    n = readInt(&temp);
    for(i = 0; i < n; i = i + 1) {
    m = readInt(&temp);
    a[i] = m;
    }
    m = a[0];
    for(i = 1; i < n; i = i + 1) {
    if (a[i] > m)
    m = a[i];
    }
    printStr("Max of: ");
    printInt(a[0]);
    for(i = 1; i < n; i = i + 1) {
    printStr(", "); printInt(a[i]);
    }
    printStr(": = ");
    printInt(m);
    return 0;
}