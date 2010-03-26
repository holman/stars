# stars
### you're so vain / you probably think these stars are about you

## why

[Favstar](http://favstar.fm) is about opening another line of dialogue between you and your Twitter followers. Like the one where someone likes what you tweet but is too nervous to tell you to your face and they star your tweets instead, so instead you shake them down in the kitchen after a long tequila bender and steal their precious stars and keep them for yourself.

So anyway, I spend a lot of time on the command line, and switching over to the browser just to view [my stars](http://favstar.fm/users/holman) is so passé.

## how

Install with `gem install stars`, then do a quick `stars`, fill in your Twitter username, and let it do its sultry magic. This is me lately:

     ★  by @holman
    +----+-----------+--------------+--------------------------------------------------------+
    | #  | Stars     | Time         | Your Funnies                                           |
    +----+-----------+--------------+--------------------------------------------------------+
    | 1  | *         | 12 hours ago | Today's GitHub todo list: put cupholders in the for... |
    | 2  | * * *     | 1 day ago    | This bus is going so slowly that my AT&T 3G coverag... |
    | 3  | * * * * * | 2 days ago   | Every now and then I bust out that I'm from North D... |
    | 4  | * * *     | 3 days ago   | Was told that "y'alls be stupid" by an adamant stre... |
    | 5  | * *       | 4 days ago   | Now that we've fixed healthcare forever, who wants ... |
    | 6  | * * * *   | 4 days ago   | Just wikipedia'd "Justin Bieber" and I still don't ... |
    | 7  | * * * *   | 5 days ago   | Look. I'm not saying David Copperfield is a little ... |
    | 8  | *         | 6 days ago   | SFO.  Guys, we're at TERROR ALERT ORANGE. I don't t... |
    | 9  | *         | 7 days ago   | Dammit. 2012 looks like garbage so far, but if a mo... |
    | 10 | *         | 10 days ago  | At the MySQL + Rails combined meetup. I don't want ... |
    | 11 | *         | 10 days ago  | Oh, they're doing a MacGruber movie. This makes sen... |
    | 12 | * * *     | 10 days ago  | Just got my third free replacement earbuds from the... |
    | 13 | * x 13    | 11 days ago  | So for the seven of us that are both nerdy *and* va... |
    | 14 | * * * * * | 11 days ago  | I wouldn't say I'm "saving daylight" as much as I'm... |
    | 15 | * * *     | 13 days ago  | I pre-ordered an iPad, checked into lunch, and now ... |
    | 16 | * *       | 13 days ago  | In another life I want to be a pop star heartthrob ... |
    | 17 | *         | 14 days ago  | Oh hey, a year or so of my beer consumption: http:/... |
    | 18 | *         | 14 days ago  | Going to totally refork and rework my dotfiles soon... |
    | 19 | * * *     | 15 days ago  | You change your Facebook pic, that syncs to my iPho... |
    | 20 | * *       | 17 days ago  | just about finished my thesis on generating free en... |
    +----+-----------+--------------+--------------------------------------------------------+


You can tell from the relative dearth of stars that I'm in my *screw followers I'm important so here's what I had for lunch* phase. Don't worry; I'll become a star whore again and tweet pop culture references in relation to presidential penile size soon enough.

You can also specify which user you want to run the query against by passing it in as your one argument. This value is saved for he future, too. For example:

    stars holman        # generates @holman's stars
    stars               # generates @holman's stars
    stars goodtutorials # generates @goodtutorials' stars
    stars               # generates @goodtutorials' stars

You can also get some knowledge dropped all over your face about a specific toot:

	Type the number of the toot that you want to learn about
	  (or hit return to view all again, you ego-maniac)   >>
	14

	  5 stars: I wouldn't say I'm "saving daylight" as much as
	    I'm sequestering it in a small room underneath my stairs so
	    its screams can't be heard.
    
	    ★  twilighteyes08
	    ★  itsjustEm
	    ★  aklw
	    ★  shariv67
	    ★  IsJonas


## state of affairs

Fork this bad boy and shape it as you see fit. I just randomly built some shit that I might like; maybe that process will work for you, too. Send me a pull request if you ship something awesome. Reminder: something is never awesome without tests.

## who

[@holman](http://twitter.com/holman) did this. Follow me and star my stuff incessantly so we can prove to Dean Allen that stars are as important as currency, much [to his logically-argued dismay](http://favrd.textism.com/).