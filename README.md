# Currency Trading
Use these currency classes to assist you in exchanging with and investing your money in foreign currencies.


## Build Your Original Currency
Initiate a Currency object using the currency code or symbol and monetary value of the currency you wish to trade or exchange.

The following methods methods may be called on a Currency object.
* amount: This will retrieve just the number value of your Currency object.
* code: This will retrieve just the country code of your Currency object.
* ==, <=>, +, -, / and *

##Convert Currency
To convert your currency object into a different currency, initiate this object with a hash of the current currency exchange rates.  

The following methods may be called on a CurrencyConverter object.
* convert(Currency object, destination currency code):  This will convert your currency object into a different currency.
* hash: This will retrieve the initialized hash of currency exchange rates.

## Currency Trader
Initialize a CurrencyTrader object to trade your Currency object between two points in time or to see if a trade would be profitable or not. Initialize this object with an array of CurrencyConverter objects.  These should be in chronological order within the array.  Also in the initialization you should include the Currency object that includes your original currency and value.

The following methods may be called on a CurrencyConverter object.

* best_trade: This method can be used with many CurrencyConverter object to plan the best path for investment through time.
* should_i_trade(destination currency): This will use the first two hashes in your initialization array to determine wether an investment in the destination currency that you enter would result in a profit or not over time.
