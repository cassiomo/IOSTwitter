Twitter Redux

Time spent: 18 

Comments:  

I still not able to figure out why my apps was login twice to twitter once I click on the button. 
When I logout the apps and next time I login to the app and my navigation bar item go away and I have 
to logout and login again to see the screen. I have been spent quite few time to research and look for 
the anyway to avoid it. Please let me know if you find anything. 


Features
Required

[x] Hamburger menu

[x] Dragging anywhere in the view should reveal the menu.

[x] The menu should include links to your profile, the home timeline, and the mentions view.

[x] The menu can look similar to the LinkedIn menu below or feel free to take liberty with the UI.

[x] Profile page

[x] Contains the user header view

[x] Contains a section with the users basic stats: # tweets, # following, # followers

[x] Home Timeline

[x] Tapping on a user image should bring up that user's profile page

Optional

[ ] Profile Page

[ ] Optional: Implement the paging view for the user description.

[ ] Optional: As the paging view moves, increase the opacity of the background screen. See the actual Twitter app for this effect

[ ] Optional: Pulling down the profile page should blur and resize the header image.

[ ] Optional: Account switching

[ ] Long press on tab bar to bring up Account view with animation

[ ] Tap account to switch to

[ ] Include a plus button to Add an Account

[ ] Swipe to delete an account

Walkthrough

![Alt text](https://github.com/cassiomo/IOSTwitter/blob/master/iostwitterredux.gif "iostwitterredux.gif")
Twitter (raw)

-------------------------------------------------------------------------------------------------------------------------------------------------------------

This is a basic twitter app to read and compose tweets the Twitter API.

Feedback:

Redo the twitter: 

Time spent: 15 

Features
Required

[x] User can sign in using OAuth login flow

[x] User can view last 20 tweets from their home timeline

[x] The current signed in user will be persisted across restarts

[x] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp. In other words, design the custom cell with the proper Auto Layout settings. You will also need to augment the model classes.

[x] User can pull to refresh

[x] User can compose a new tweet by tapping on a compose button.

[x] User can tap on a tweet to view it, with controls to retweet, favorite, and reply.

[x] User can retweet, favorite, and reply to the tweet directly from the timeline feed.

Optional

[ ] When composing, you should have a countdown in the upper right for the tweet limit.

[ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.

[ ] Retweeting and favoriting should increment the retweet and favorite count.

[ ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.

[ ] Replies should be prefixed with the username and the reply_id should be set when posting the tweet,

[ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.

Walkthrough

![Alt text](https://github.com/cassiomo/IOSTwitter/blob/master/iostwitter.gif "iostwitter.gif")

