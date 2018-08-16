# Contributing to XOD Documentation

If you would like to improve the XOD documentation, thank you in advance!
Suggesting your edits is not rocket science, although it requires some effort to
get comfortable with if you have never contributed to an open source project
before.

## Change cycle

1.  Fork this repository
2.  Make changes
3.  Open a Pull Request
4.  Wait for review
5.  Fix the issues reported
6.  See the changes at https://xod.io/docs/

There are two ways to accomplish the first three steps.

**Quick**. If you want to fix a typo or make a very local change, you can simply
use the GitHub web interface without touching any Git tools. See the
[Editing files in another user’s repository](https://help.github.com/articles/editing-files-in-another-user-s-repository/)
guide to learn how. Using the web interface for bigger changes is not a good
idea because it is much harder to manage, check, update, review.

**Complete**. Clone your fork, make a branch, make the changes in your favorite
text editor, push and open the pull request. See the
[Forking Projects](https://guides.github.com/activities/forking/) guide.

Once you open a pull request, we’ll review the changes as soon as we can.
Usually, it’s a matter of one day. We can ask you to fix some things. In this
case, add new commits to the same PR branch, that is, do not close-then-open the
existing PR.

When the PR is approved and merged into the `master` branch, the change will
appear on the production server very soon.

## Prettifying

If you’ve done a non-trivial change, make sure to run Prettier which will format
your files automatically making it consistent with other sources.

To do it you should have a terminal application, NodeJS, and Yarn installed
system-wide. Open the terminal in your repository clone directory and run:

```bash
$ yarn
# Will install Prettier. Enough to invoke only once

$ yarn prettier ./docs/path/to/your/FILE.md
# This will re-format and save the file pointed
```

## Naming branches and commit messages

This repository places no strict rules on branch names and commit messages. Just
try to keep them sane and easy to understand.

The commits in a pull request you would open will be squashed into a single
commit and re-worded if necessary right before merging into `master`.

## Common scenarios

### Fix typo or grammar

Use the quick way.

Find the Markdown file containing the text to fix and press the Edit button in
the web interface. Fix the article using the browser. Increment the patch part
of `version` in the front matter.

If the `version` is not there, add it with `1.0.1` value.

Propose the changes and open a pull request clicking on buttons in the web
interface.

### Provide translation

Use the complete way. Fork, clone, branch.

Create a new file with the name `DE.md`, `ES.md`, `FR.md`, `IT.md`, `JA.md`,
`KO.md`, `PT.md`, `RU.md`, `ZH.md`, etc depending on the target language next to
the original `README.md`.

Write the translation of the `README.md` content there. Preserve Markdown
formatting, notably, backticks around XOD identifiers.

Push, pull request.

Prefer pushing one article per pull request to make the review and approval more
agile.

### Add project to Showcase

Use the full way because you have to add an image. Fork, clone, branch.

Add a thumbnail of your project to `./docs/__img__`. Prefer photos to collages
and JPG over PNG.

Insert a new card for the project into `./docs/README.md`. Place the card at the
very top position: the latest projects go first.

Push, pull request.
