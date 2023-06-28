# OldSquare WMS

**A simple application to manage a pub's warehouse and make orders simpler!**

https://drive.google.com/file/d/17iUDnqktF_yVr9Ub4_EiBrMKECo02MwX/view?usp=drive_link

## What's the point?

When it's time to make some new orders and manage the pub's inventory, it can become a long and hard process. A person commissioned to do this work has to check the availability of all products in all stocks situated on different levels of the pub and write down every single product (name, price per kg, ct or unit, supplier, etc) that should be ordered to the organizer. After all products have been added to the organizer, it's time to send emails to each supplier! So it takes quite a while to find the right product for each supplier in the organizer, add it to the message that should be sent, and then add every product to the Google Sheet file and get some statistics about orders using different formulas... A really long process!

## So what's the solution?

The proposal is to digitalize this task and make it faster and simpler! The application allows you to manage all products situated in the database (Firestore in this case), add new suppliers, make new orders by simply clicking one button, and store every order in the database! The use of this application is very simple: choose the consumable, insert its type (kg, unit, ft, ecc), insert the needed quantity, and simply add it to your cart. Once all consumables are added, just press the "Order" button if you don't want to send a message or add a subject to the mail (it's also possible to add a message or subject for each supplier by clicking a blue button and selecting the right supplier). The application uses [mailer package](https://pub.dev/packages/mailer) to send emails. This package requires to setup SMTP server and a token for it. As the company uses Gmail to make orders, I've used the [Google Sign In package](https://pub.dev/packages/google_sign_in) to log in with OAuth 2 and get the token to setup the SMTP server. After everything is done, the order is added to Firebase so we can see it later and use it for different proposals

## What next?

The application has huge potential, as it has a lot of directions to grow! The first functional I'd like to introduce is to create a FirebaseFunction that creates a sheet in Google Sheets that contains order info using the Google Sheets API. This step gives another storage option and allows us to use old ways to calculate the average amount of money and consumables spent in a month. This allows us to see the business performance and change strategy when needed. The second step is to create an algorithm that replaces Google Sheets and calculates an average of money spent on consumables relative to the number of clients and monthly income.
