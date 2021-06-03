/* ======================================================

   Created:  2021/06/03, 01:29:28

   Version:   1.0
   Branch:    master

   Author:  Akari
   License: GNU General Public License v3

   ======================================================
*/

ipow(base, exp)
{
    auto result; result = 1;

    while (1) {
        if (exp & 1) result =* base;
        exp = exp >> 1;
        if (exp == 0) break;
        base =* base;
    }

    return (result);
}

iscanf()
{
    auto pos[10], temp; /* Position for base 10 | Store input */
    auto num;
    temp = 0; num = 0;

    /* Only takes in numerical input, else exits */
    auto posSize; posSize = 0;
    while ((temp = getchar()) != '*n') {
        if (!(temp >= '0' | temp <= '9')) {
            printf("Invalid Input!*n");
            exit();
        }

        pos[posSize++] = temp;
    }

    /* Convert ASCII value to Int */
    auto i; i = posSize - 1;
    auto j; j = 0;
    while (i >= 0) {
        num =+ (pos[i] - 48) * (ipow(10, j));
        --i; ++j;
    }

    return (num);
}

False 0;
True 1;

WORDS[2] "Fizz", "Buzz";

main()
{
    extrn WORDS, False, True;
    auto input;

    printf("How many numbers to iterate? ");
    input = iscanf(); putchar('*n');

    auto i; i = 1;
    while(i <= input) {
        auto divis; divis = False; /* Boolean for if a number is divisible */

        /* Fizz */
        if (i % 3 == 0) { printf("%s", WORDS[0]); divis = True; }
        /* Buzz */
        if (i % 5 == 0) { printf("%s", WORDS[1]); divis = True; }

        (divis == True)
            ? putchar('*n')
            : printf("%d*n", i);

        ++i;
    }

    return (0);
}
