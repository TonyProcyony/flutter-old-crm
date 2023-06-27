# OldSquare WMS

**A simple application to manage pub's warehouse and make orders simplier!**

## What's the point?

When it's time to make some new orders and manage pub's inventory it can become a long and hard procces. A person chareged to do this work has to check the aviability of all products in all stocks situated on different levels of the pub, write down every single product (name, price per kg/ct/unit, supplier ecc) that should be ordered to the organizer. After all pproducts were added to the organizer it's time to send email to each supplier! So it require a quite long time to find the right product for each supplier in organizer, add it to message that should be sended, and then add every product to the Google Sheet file and get some statistics about orders using different formulas... A really long process!

## So what's the solution?

The proposal is to degitalize this task and make it faster and simplier! Application alows you to manage all products situated in database (Firestore in this case), add new suppliers, make new orders by simply clicking one button and store every order in database! The use of this application if very simple - choose the consumable, insert it's type (kg, unit, ft, ecc), insert needed quantity and simply add it to your cart. Once all consumables are added just press "Order" button if you don't wont to send a massage or add a subject to the mail (it's also possible to add a message or subject for each supplier clicking a blue button and selecting a right supplier). The application uses [mailer package](https://pub.dev/packages/mailer) to send emails. This package requires to setup SMTP server and a token for it. As the company use Gmail to make orders, I've used the [Google Sign In package](https://pub.dev/packages/google_sign_in) to log in with OAuth 2 and get the token to setup the SMTP server. After everything is done the order is added to Firebase so we can see it later and use for different proposes

## What next?

The application has a huge potential as it has a lot of directions to grow! The first functional I'd like to introduce is to create a FirebaseFunction that create a sheet into Google Sheets that contains order info using Google Sheets API. This step gives another storage option and it allows to uses old ways to calcualte the average of money and consumables spent in a month. This allows to see the business performance and to change strategy when needed. The second step is to create an algorithm that replace Google Sheets and calculates an average of money spnet on consumables relative to number of clients and monthly income.
