# Test assignment
## Bakery challenge

### To get
Fork and clone, or just download zip.

### To run
Uncomment lines at the bottom of bakery.rb to run from command line.
(Program is implemented like a class, so for using methods you need to initialize it like `bakery = Bakery.new`, and then run `bakery.order()`)

Open terminal in your IDE, or cmd. Go to the root of the project.\
Then type
```
ruby bakery.rb
```

*order* method could be run in two ways:
- with no arguments passed in code - input from console
- with valid string like order("10 VS5")


#### Input
Each order has a series of lines with each line containing the number of items followed by the product code. An example input:
```
10 VS5
14 MB11
```
! To stop writing input just type 0 in the new line. !
### To test
In your command line type
```
ruby test.rb
```
You should get following output:
```
Loaded suite test
Started
...
Finished in 0.001311309 seconds.
--------------------------------------------------------------------------------------
3 tests, 3 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
--------------------------------------------------------------------------------------
```
## About challenge


Test Input:
```
10 VS5

14 MB11

13 CF
```
Expected Output:
```
10 VS5 $ 17.98
  2 x 5 $ 8.99
14 MB11 $ 54.8
  1 x 8 $ 24.95
  3 x 2 $ 9.95
13 CF $ 25.85
  2 x 5 $ 9.95
  1 x 3 $ 5.95
21 VS5 $ 40.95
  3 x 5 $ 8.99
  2 x 3 $ 6.99
27 MB11 $ 94.7
  5 x 5 $ 16.95
  1 x 2 $ 9.95
28 CF $ 53.88
  2 x 9 $ 16.99
  2 x 5 $ 9.95
```
In my case for `27 MB11` I get following, which has also 6 packs but get 96.7 (which is better for shop, heh) :
```
27 MB11 $96.7
2 x 8 $24.95
1 x 5 $16.95
3 x 2 $9.95
```
