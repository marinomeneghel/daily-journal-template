# Daily journal template
A very lean way to implement the Agile Daily Journal practice.

## Purpose
This template have been created mainly for fun (and to try out unit testing sh scripts :D), with the goal of automating some recurring steps I take every day
After using the Daily Jorunal in some of the XP teams I worked with, finding it very valuable to foster self-reflection and improvement, I found myself in some cases where the team haven't adopted it yet, but I still want to do it for myself.
Not having some better platforms (like Discourse of whatsoever) already available, and not wanting to set that up, I started creating Markdown files and adding them to a repo.
Automating part of this is all this template does - nothing too fancy here.

## How to use
* Clone the repo
* Rename folder as you want
* **change the remote to point to wherever you want to store your journal**
* execute `./bin/daily_journal.sh {ARG_TITLE}`
* Write your journal and save ;)

## Testing
The `new_journal` bash script is unit tested using [bats-core](https://github.com/bats-core/bats-core#setup-and-teardown-pre--and-post-test-hooks) and [bats-mock](https://github.com/jasonkarns/bats-mock)

Run tests with ```bats ./test/new-journal-test.sh```

## Improvements
Many things can be improved from the current state, like
* Create directories to store journals by month
* Refactor tests extracting common stubs
* Create script to add alias to `daily_journal` script execution
* Add tests execution to git pre-push hook
* Init journal with filename as title
* Improve tests to avoid flackiness with mocking / unmocking

## Contributing
More than happy if anyone wants to change stuff here, improvement list's above and I'm also happy to include whatever else. Just open a PR ;)
