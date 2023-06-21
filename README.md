# OldSquare Crm

A simple application to manage pub's inventory and to make orders simplier!

## What's the point?

When the time comes to order some items like napkins, or sanitizers, or some straws it can become quite difficult and long process. First you have to check the availability of the item in different stocks. Then you have to wirte down the product's name, quantity you need to order, the name of supplier, it's price per piece and a day of the order into a big book called "orders book". Repeat the procedur for every product that is about to end. After you finish to write down every product to the "orders book" you have to send email to each supplier with all products and their quantity to order them. This procedure requires a lot of time because there're a lot of different items stored in differente places and levels of the pub.

## The solution

Instead of using "orders book" you can just simply use your smartphone to make it work for you! Choose the quantity of product you need to order, add it to cart and once you finish with all products (you can add a message for each supplier if you want to) just tap one button to send email to every supplier and store all information about your order into a cloud, accessible whenever you need it! The application is very simple to use. It has 4 screens:

The first is a simple list of all products retrieved from Firebase. Long pressing the product widget alows you to modify it. It also has a search engine to let it simplier to find the right product, select the needed quatity and add it to cart.

The second one shows you shows the history of your orders. Click on the date to see what have you ordered.

The third screen is the cart that shows you all products you have added to it and two buttons - "order" and "add a message" that allows you to choose the supplier and add a message into your order. The order button sends email using mailer package and google sign in package to setup your credentials and SMTP server to send emails.

The last screen let you add new products, mange suppliers and change the google user if you need to.

## What's next?

In short I wiil create a new screen that returns some statisctis. It will display monthly budget spended on different itmes and let you compare money used in different months to let you understand why you spned more or less in certain period of time