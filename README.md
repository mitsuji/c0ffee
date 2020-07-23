# c0ffee

Find words like "coffee" (#C0FFEE) which can be written as hexadecimal number.

Sample code in Haskell: [app/Main.hs](https://github.com/mitsuji/c0ffee/blob/master/app/Main.hs)

## Example

coffee(#C0FFEE)
adobe(#AD0BE)
accel(#ACCE1)
access(#ACCE55)
alfalfa(#A1FA1FA)
bool(#B001)
bossa(#B055A)
cascade(#CA5CADE)
codec(#C0DEC)
dazzle(#DA221E)
deal(#DEA1)
decade(#DECADE)
elsa(#E15A)
facade(#FACADE)
feel(#FEE1)
foldable(#F01DAB1E)
label(#1ABE1)
offload(#0FF10AD)
sabae(#5ABAE)
saddle(#5ADD1E)
safe(#5AFE)
sales(#5A1E5)
scala(#5CA1A)
scale(#5CA1E)
seed(#5EED)
zelda(#2E1DA)
...


## Rules

* Getting a list of English words from [words.txt](https://github.com/dwyl/english-words/blob/master/words.txt) in [english-words](https://github.com/dwyl/english-words).

* The letters 'A' to 'F' and 'a' to 'f' could be written as hexadecimal number as usual.
* The letter 'I' could be written as number 1.
* The letter 'O' could be written as number 0.
* The letter 'S' could be written as number 5.
* The letter 'Z' could be written as number 2.
* The letter 'l' could be written as number 1.
* The letter 'o' could be written as number 0.
* The letter 'q' could be written as number 9.
* The letter 's' could be written as number 5.
* The letter 'z' could be written as number 2.

## Prerequisite

* This project using programming language Haskell, so you need [Stack](https://docs.haskellstack.org/en/stable/README/) build tool properly installd to run example code.
* Download [words.txt](https://github.com/dwyl/english-words/blob/master/words.txt) to the current directory.


## How to use

To just run example
```
$ stack run < words.txt
```

To build executeble
```
$ stack build
```

To install and run example
```
$ stack install
$ ~/.local/bin/c0ffee-exe < words.txt
```

