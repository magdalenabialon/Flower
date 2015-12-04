## Flower Shop Code Challenge

● Navigate to the root of the folder and run “bundle install” to install any

dependencies.

● Run “ruby run.rb” to execute the program.

● To run the test ­ type “rspec spec/order_spec.rb” or “rspec

spec/flower_shop_spec.rb”



##Context:

A flower shop used to base the price of their flowers on an item by item cost. So if a
customer ordered 10 roses then they would be charged 10x the cost of single rose. The
flower shop has decided to start selling their flowers in bundles and charging the customer
on a per bundle basis. So if the shop sold roses in bundles of 5 and 10 and a customer
ordered 15 they would get a bundle of 10 and a bundle of 5.
The flower shop currently sells the following products:

Name Code Bundle
Roses R12 5 @ $6.99
10 @ $12.99
Lilies L09 3 @ $9.95
6 @ $16.95
9 @ $24.95
Tulips T58 3 @ $5.95
5 @ $9.95
9 @ $16.99

##Task:

Given a customer order you are required to determine the cost and bundle breakdown for
each product. To save on shipping space each order should contain the minimal number
of bundles.
##Input:

Each order has a series of lines with each line containing the number of items followed by
the product code
An example input:
10 R12
15 L09
13 T58

##Output:

A successfully passing test(s) that demonstrates the following output: (The format of the
output is not important)

10 R12 $12.99
    1 x 10 $12.99
15 L09 $41.90
    1 x 9 $24.95
    1 x 6 $16.95
13 T58 $25.85
    2 x 5 $9.95
    1 x 3 $5.95
    
##My Output

10 ROSES
Cost: $ 12.99
------------------
Qty | Bundle Size
1  X   10  $ 12.99 
------------------
15 LILIES
Cost: $ 41.9
------------------
Qty | Bundle Size
1  X  9  $ 24.95 
1  X  6  $ 16.95 
------------------
13 TULIPS
Cost: $ 25.85
------------------
Qty | Bundle Size
2  X  5  $ 19.9 
1  X  3  $ 5.95 
------------------

The total price is  $ 80.74
Thank You for buying flowers !

