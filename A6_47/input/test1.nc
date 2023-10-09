int main() {
int n;
int y;
int i = 0;
int r = 1;
n = readInt(&y);
for(i = 1; i <= n; i = i + 1)
r = r * i;
printInt(n);
printStr("! = ");
printInt(r);
return 0;
}