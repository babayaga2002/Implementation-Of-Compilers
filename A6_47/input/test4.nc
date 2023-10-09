int factorial(int n) {
if (n == 0)
return 1;
else
return n * factorial(n-1);
}
int main() {
int n;
int r;
n = readInt(&r);
r = factorial(n);
printInt(n);
printStr("! = ");
printInt(r);
return 0;
}