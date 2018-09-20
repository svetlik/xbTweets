# xbTweets

A simple Rails + VueJS project, that displays tweets from three accounts, and supports rearrangement of the tweets, searching, limiting number of displayed tweets, as well as keeping the rearranged tweets after page refresh.

## How to run the project

0. Clone the project from this repository: run `git clone git@github.com:svetlik/xbTweets.git`

1. Execute `bundle && yarn` to download all packages.

2. Create a `.env` file in the project root directory and add values for CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET. Example:
```
CONSUMER_KEY="tralala"
CONSUMER_SECRET="hogehoge"
ACCESS_TOKEN="piyopiyo"
ACCESS_TOKEN_SECRET="fugafuga"
```

3. Start the project using `foreman start -f Procfile.dev`

## Functionality

- __Display only the last 5, 10, 20, or 50 tweets__ by clicking on one of the four buttons
- __Filter tweets__ by writing some text in the Search bar
- __Rearrange the tweets__ by draggin and dropping them within their column
- __The rearrangement of tweets will be saved__ when you refresh the page.

## Demo

A live demo of the project is available on [Heroku](https://fast-inlet-68255.herokuapp.com)
