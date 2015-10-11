Twitter (raw)

This is a basic twitter app to read and compose tweets the Twitter API.

Feedback:

I am not able to complete the assignment due to challenge facing in the following code:

completion(tweets: tweets, error: nil)

The code has not been able to compile due to nil is not able to pass in to the method. I follow the video and search for stackoverflow and not able to find the solution. It complains about the nil is not compatible with expected argument type 'NSError'

Time spent: 15 

Features
Required

[x] User can sign in using OAuth login flow

[x] User can view last 20 tweets from their home timeline

[ ] The current signed in user will be persisted across restarts

[ ] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp. In other words, design the custom cell with the proper Auto Layout settings. You will also need to augment the model classes.

[ ] User can pull to refresh

[ ] User can compose a new tweet by tapping on a compose button.

[ ] User can tap on a tweet to view it, with controls to retweet, favorite, and reply.

[ ] User can retweet, favorite, and reply to the tweet directly from the timeline feed.

Optional

[ ] When composing, you should have a countdown in the upper right for the tweet limit.

[ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.

[ ] Retweeting and favoriting should increment the retweet and favorite count.

[ ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.

[ ] Replies should be prefixed with the username and the reply_id should be set when posting the tweet,

[ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.

Walkthrough

![Alt text](https://github.com/cassiomo/IOSTwitter/blob/master/iostwitter.gif "iostwitter.gif")
