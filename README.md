# Daily journal template
A lean way to implement the Daily Journal practice.

## Purpose
This template have been created mainly for fun (and for trying out unit testing bash scripts with [bats](https://github.com/bats-core/bats-core#setup-and-teardown-pre--and-post-test-hooks)), with the goal of automating some recurring steps I take every day.

Working in my first XP team in XPeppers I discovered the "Daily Journal" practice, finding into it a great tool for self-reflection and improvement both on personal and team level.
When moving to different teams, I found myself in situations where the team wasn't adopting this practice but I still want to do it for myself.
This repo is automating some of the steps to create and publish a very lean Daily Jorunal with Markdown and git.

## How to use
* Clone the repo
* Rename it as you want
* **Change the remote to point to wherever you want to store your journal**
* Execute `./bin/daily_journal.sh {ARG_TITLE}`
* Write your journal and save

## Testing
The `new_journal` bash script is unit tested using [bats-core](https://github.com/bats-core/bats-core#setup-and-teardown-pre--and-post-test-hooks) and [bats-mock](https://github.com/jasonkarns/bats-mock)

Run tests with ```bats ./test/new-journal-test.sh```

## Improvements
Here are some potential improvements over the current state:
* Create directories to store journals by month
* Refactor tests extracting common stubs
* Create script to add alias to `daily_journal` script execution
* Add tests execution to git pre-push hook
* Init journal with filename as title
* Improve tests to avoid flackiness with mocking / unmocking
* Open new journal as a vim tab if a session exists


## Contributing
More than happy if anyone wants to change stuff here, improvement list's above and I'm also happy to include whatever else. Just open a PR ;)
