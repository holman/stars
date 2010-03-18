# stars
### you're so vain / you probably think these stars are about you

## why

[Favstar](http://favstar.fm) is about opening another line of dialogue between you and your Twitter followers. Like the one where someone likes what you tweet but is too nervous to tell you to your face and they star your tweets instead, so instead you shake them down in the kitchen after a long tequila bender and steal their precious stars and keep them for yourself.

So anyway, I spend a lot of time on the command line, and switching over to the browser just to view [my stars](http://favstar.fm/users/holman) is so passé.

## how

Install with `gem install stars`, then do a quick `stars`, fill in your Twitter username, and let it do its sultry magic. This is me lately:

    +---------+-------------+--------------------------------------------------------+
    | Stars   | Time        | Your Funnies                                           |
    +---------+-------------+--------------------------------------------------------+
    | * *     | 11 days ago | I have a severe sore throat.  Or, if I said that ou... |
    | * *     | 11 days ago | Way too many Scientology ads on Muni buses.  It wor... |
    | *       | 11 days ago | Napping didn't fix this cold; I feel a bit worse. M... |
    | *       | 10 days ago | God I leave the room for one minute and the girls o... |
    | *       | 10 days ago | Man, Avatar really fucked Up.                          |
    | *       | 9 days ago  | I'd play out here, but the west coast is all about ... |
    | *       | 9 days ago  | I just want to know who moved my Maps app to my iPh... |
    | * *     | 9 days ago  | just about finished my thesis on generating free en... |
    | * * *   | 7 days ago  | You change your Facebook pic, that syncs to my iPho... |
    | *       | 6 days ago  | Going to totally refork and rework my dotfiles soon... |
    | *       | 6 days ago  | Oh hey, a year or so of my beer consumption: http:/... |
    | * *     | 5 days ago  | In another life I want to be a pop star heartthrob ... |
    | * * *   | 5 days ago  | I pre-ordered an iPad, checked into lunch, and now ... |
    | * * * * | 3 days ago  | I wouldn't say I'm "saving daylight" as much as I'm... |
    | * x 13  | 3 days ago  | So for the seven of us that are both nerdy *and* va... |
    | * * *   | 2 days ago  | Just got my third free replacement earbuds from the... |
    | *       | 2 days ago  | Oh, they're doing a MacGruber movie. This makes sen... |
    | *       | 2 days ago  | At the MySQL + Rails combined meetup. I don't want ... |
    +---------+-------------+--------------------------------------------------------+

You can tell from the relative dearth of stars that I'm in my *screw followers I'm important so here's what I had for lunch* phase. Don't worry; I'll become a star whore again and tweet pop culture references in relation to presidential penile size soon enough.

You can also specify which user you want to run the query against by passing it in as your one argument. This value is saved for he future, too. For example:

    stars holman        # generates @holman's stars
    stars               # generates @holman's stars
    stars goodtutorials # generates @goodtutorials' stars
    stars               # generates @goodtutorials' stars

## state of affairs

This was a one-night hack thing; ideally it'd be cool to maybe retain some "this was read" state, and improve the formatting (if only "★" worked better in a fixed-width environment, AMIRITE?). All in due time. I mean, for you to fork and do it yourself, I mean.

## who

[@holman](http://twitter.com/holman) did this. Follow me and star my stuff incessantly so we can prove to Dean Allen that stars are as important as currency, much [to his logically-argued dismay](http://favrd.textism.com/).