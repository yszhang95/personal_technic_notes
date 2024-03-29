- [Basic](#org62f1ab6)
  - [Files](#orgdb7e722)
    - [Find a file](#org6be7646)
    - [Save a file](#orgbc077ba)
    - [to end the Emacs session](#org651783f)
  - [BUFFERS](#org83f72c7)
    - [List, switch and save buffers](#org65d4752)
  - [Commands](#org5749849)
    - [Repeat counts](#org3b96805)
    - [To quit a partially entered command](#org47b776f)
    - [Disabled commands](#org17bcc9d)
    - [Extending the command set](#org3b8ff3e)
    - [C-z](#org6a9483e)
    - [Set margin size](#org7dbf07b)
    - [Re-fill inside the middle of a paragraph](#org1f7c256)
    - [Searching](#orgb20ae71)
    - [`<ESC> <ESC> <ESC>`](#orgb2a0984)
  - [Windows](#orgc7eb612)
  - [Movements](#orga810bb7)
    - [View next (previous) screen](#org015331b)
    - [`C-l`](#orgebd41ea)
    - [`C-b`, `C-p`, `C-f`, `C-n`, `M-b`, `M-f`](#orga1f9778)
    - [C-a, C-e, M-a, M-e](#org96c981c)
    - [M-<, M->](#org6551d47)
  - [Edit](#orgd68541b)
    - [`<DEL>`, `Backspace`, `C-d`, `M-d`, `M-<DEL>`, `C-k`, `M-k`](#orgf8be2da)
    - [Cut, copy and paste](#org1c99e4f)
    - [Undo  `C-/`, `C-_`, `C-x u`](#org5054f74)
    - [Completion](#org2b77bfc)
    - [Dired](#orgecb093b)
  - [HELP](#orgbbfc540)
  - [Terms](#org965499b)
    - [electric](#org8b33960)
    - ["continued" line](#orgf7288e9)
    - [kill, delete and yank](#orga3ca89f)
    - [AUTO SAVE and recover](#org35abdef)
    - [ECHO AREA](#orgd655470)
    - [MODE LINE](#org55b6d39)
    - [Major modes](#org3105de8)
    - [Minor modes](#orgae29c0d)
    - [Frames](#orgc6da53a)
    - [RECURSIVE EDITING LEVELS](#org159f5c6)
    - [Dired](#org6479df7)
- [Emacs client](#org98a5092)
  - [unix-like](#org33f4268)
  - [windows](#orgcbfe0c8)
  - [kill](#orgcb5b866)
- [Org mode](#org47ceec9)
  - [Outline and document structure](#org34c4d59)
    - [Structure editing](#org1b9e5ba)
    - [Visibility of cycling](#org72c9a38)
    - [Motion](#org64fa38a)
    - [Sparse tree](#org4dace9b)
    - [Plain lists](#org3ed8e2d)
  - [Table](#orga5e0847)
    - [Creation and conversion](#org169a5cc)
    - [Re-aligning and field motion](#org292d422)
  - [Hyperlinks](#org0aaf3df)
    - [Link](#org41af21a)
  - [`TODO` items](#org3593b24)
    - [Basic functionality](#org24681da)
    - [Multi-state workflow](#org4f0f387)
    - [Progress logging](#orgb124dcd)
    - [Priorities](#org3704dbf)
    - [Breaking tasks down into subtasks](#org29e0bf0)
    - [Checkboxes](#org23a43f1)
  - [Tags](#org1318532)
    - [Tag inheritance](#org111ebf1)
    - [Setting tags](#orgbc4baac)
    - [Tag groups](#org94df8a8)
    - [Tag searches](#org9cfce5e)
  - [Properties](#orgac74594)
  - [Dates and times](#orgca3d95d)
    - [Timestamps](#org6fdca3d)
    - [Creating timestamps](#org786565f)
    - [Deadlines and Scheduling](#org3bddae4)
    - [Clocking work time](#orgdc0ac94)
  - [Capture, refile and archive](#org736e790)
    - [Capture](#orgd517542)
  - [Agenda Views](#orgb803f80)
    - [Agenda files](#orgf595b05)
    - [The agenda dispatcher](#org3c7266b)
    - [The weekly/daily agenda](#org88e8a79)
    - [The global TODO list](#orge8250a2)
    - [Matching tags and properties](#org5bb0912)
    - [Search view](#org2cb988b)
    - [Commands in the agenda buffer.](#org9e20726)
  - [Code blocks](#org333db7e)
    - [Inline](#orgfef999b)
    - [Structure templates](#orgfc3661c)
    - [Evaluating code blocks](#org5d7354f)
  - [Export](#orgb62ce08)
    - [Commands](#org2b8ebef)
    - [Code blocks](#org942f09a)
    - [Latex](#org249f27d)
    - [Publish a project of HTML](#orgab34991)
  - [Paragraphs](#org5808f5a)
- [Compilation](#org1a7842d)
  - [C++](#orgcc6f2e2)
    - [Simplest codes](#org62228fc)
    - [Makefile exists](#org1c0b6a2)
- [TRAMP](#orgee56e9a)
  - [cleanup](#org95a6048)
- [Miscellaneous](#org2130c1f)
  - [Font Lock mode](#org23e94d1)
  - [Insert the current date to the current buffer](#orgd6feec4)
  - [Define a new keybinidng](#orgb46cc8c)
  - [Desktop](#org5bbc1c1)
    - [bookmark](#org835b288)
  - [Rescure a frozen emacs](#orgc7b3e28)



<a id="org62f1ab6"></a>

# Basic


<a id="orgdb7e722"></a>

## Files


<a id="org6be7646"></a>

### Find a file

-   **`C-x C-f`:** Find a file


<a id="orgbc077ba"></a>

### Save a file

-   **`C-x C-s`:** Save the file


<a id="org651783f"></a>

### to end the Emacs session

type `C-x C-c`.


<a id="org83f72c7"></a>

## BUFFERS


<a id="org65d4752"></a>

### List, switch and save buffers

-   **`C-x C-b`:** list buffers
-   **`C-x b`:** switch to a buffer
-   **`C-x s`:** save some buffers
-   **[Kill-Buffer](https://www.gnu.org/software/emacs/manual/html_node/emacs/Kill-Buffer.html):** -   **`C-x k buffer <RET>`:** Kill buffer buffer (kill-buffer).
    -   **`M-x kill-some-buffers`:** Offer to kill each buffer, one by one.
    -   **`M-x kill-matching-buffers` :** Offer to kill all buffers matching a regular expression.


<a id="org5749849"></a>

## Commands


<a id="org3b96805"></a>

### Repeat counts

-   `M-8 other commands`
-   `C-u 8 other commands`
    -   eg. `M-8 C-f`
    -   exceptions, `C-u 8 C-v` only scrolls by 8 lines, not screens


<a id="org47b776f"></a>

### To quit a partially entered command

type `C-g`


<a id="org17bcc9d"></a>

### Disabled commands

If you really want to try the command, type <SPC> (the Space bar) in answer to the question. Normally, if you do not want to execute the disabled command, answer the question with "n".


<a id="org3b8ff3e"></a>

### Extending the command set

-   **`C-x`:** Character eXtend. Followed by one character.
    -   **`C-x C-f`:** Find file
    -   **`C-x C-s`:** Save file
    -   **`C-x s`  :** Save some buffers
    -   **`C-x C-b`:** List buffers
    -   **`C-x b`:** Switch buffer
    -   **`C-x C-c`:** Quit Emacs
    -   **`C-x 1` :** Delete all but one window
    -   **`C-x u` :** Undo
-   **`M-x`:** Named command eXtend. Followed by a long name.
    -   `M-x replace-string`


<a id="org6a9483e"></a>

### C-z

`C-z` is the command to exit Emacs **temporarily**&#x2013;so that you can go back to the same Emacs session afterward. When Emacs is running on a text terminal, C-z "suspends" Emacs; that is, it returns to the shell but does not destroy the Emacs job. In the most common shells, you can resume Emacs with the "fg" command or with "%emacs".


<a id="org7dbf07b"></a>

### Set margin size

`C-x f`


<a id="org1f7c256"></a>

### Re-fill inside the middle of a paragraph

`M-q`


<a id="orgb20ae71"></a>

### Searching

`C-s`, forward search, `C-r`, reverse search


<a id="orgb2a0984"></a>

### `<ESC> <ESC> <ESC>`

That is an all-purpose "get out" command. You can also use it for eliminating extra windows, and getting out of the minibuffer.


<a id="orgc7eb612"></a>

## Windows

`C-x 1` One window (i.e., kill all other windows)


<a id="orga810bb7"></a>

## Movements


<a id="org015331b"></a>

### View next (previous) screen

`C-v`, `M-v`


<a id="orgebd41ea"></a>

### `C-l`

Clear screen and redisplay all the text, moving the text around the cursor to the center of the screen. (That's CONTROL-L, not CONTROL-1.)


<a id="orga1f9778"></a>

### `C-b`, `C-p`, `C-f`, `C-n`, `M-b`, `M-f`

Backward, previous line, forward, next line, no M-p nor M-n


<a id="org96c981c"></a>

### C-a, C-e, M-a, M-e

beginning or end of a line / sentence.


<a id="org6551d47"></a>

### M-<, M->

`M-<` (META Less-than), which moves to the beginning of the whole text, and `M->` (META Greater-than), which moves to the end of the whole text. On most terminals, the "<" is above the comma, so you must use the shift key to type it.


<a id="orgd68541b"></a>

## Edit


<a id="orgf8be2da"></a>

### `<DEL>`, `Backspace`, `C-d`, `M-d`, `M-<DEL>`, `C-k`, `M-k`

-   **`<DEL>`   :** Delete the character just before the cursor
-   **`C-d`     :** Delete the next character after the cursor

-   **`M-<DEL>` :** Kill the word immediately before the cursor
-   **`M-d`     :** Kill the next word after the cursor

-   **`C-k`     :** Kill from the cursor position to end of line
-   **`M-k`     :** Kill to the end of the current sentence


<a id="org1c99e4f"></a>

### Cut, copy and paste

[CopyAndPaste](https://www.emacswiki.org/emacs/CopyAndPaste)

1.  Mark the beginning, `C-<SPC>`.
2.  Move to the end.
3.  `C-w` (kill-region) or `M-w` (Kill-ring-save)
4.  Move to the place you want to paste
5.  `C-y` (yank), `M-y` yank more previous kills.


<a id="org5054f74"></a>

### Undo  `C-/`, `C-_`, `C-x u`


<a id="org2b77bfc"></a>

### Completion

Can be found in the manual Completion. It helps enter arguments.


<a id="orgecb093b"></a>

### Dired

Dired makes an Emacs buffer containing a listing of a directory, and optionally some of its subdirectories as well. The Dired buffer is normally read-only, and inserting text in it is not allowed.

1.  Enter

    C-x d


<a id="orgbbfc540"></a>

## HELP

-   `C-h ?` or `M-x help` or `<F1>`
-   `C-h c` or `C-h k` and a command character or sequence
-   `C-h f` Describe a function. You type in the name of the function.
-   `C-h v` displays the documentation of variables
-   `C-h i` Read included Manuals (a.k.a. Info).
-   `C-h a`
-   `C-h r` read manuals


<a id="org965499b"></a>

## Terms


<a id="org8b33960"></a>

### electric

The <Return> key is special, in that pressing it may do more than just insert a Newline character. Depending on the surrounding text, it may insert whitespace after the Newline character, so that when you start typing on the newly created line, the text lines up with that on the previous line. We call this behavior (where pressing a key does more than simply inserting the relevant character) "electric".


<a id="orgf7288e9"></a>

### "continued" line

If you're using a graphical display, little curved arrows appear in the narrow spaces on each side of the text area (the left and right "fringes"), to indicate where a line has been continued. If you're using a text terminal, the continued line is indicated by a backslash ('\\') on the rightmost screen column.


<a id="orga3ca89f"></a>

### kill, delete and yank

The difference between "killing" and "deleting" is that "killed" text can be reinserted (at any position), whereas "deleted" things cannot be reinserted in this way (you can, however, undo a deletion&#x2013;see below). Reinsertion of killed text is called "yanking".


<a id="org35abdef"></a>

### AUTO SAVE and recover

For example, if your file is named "hello.c", its auto save file's name is "#hello.c#". You can recover your auto-saved editing by finding the file normally (the file you were editing, **not** the auto save file) and then typing `M-x recover-this-file <Return>`.


<a id="orgd655470"></a>

### ECHO AREA

If Emacs sees that you are typing multicharacter commands slowly, it shows them to you at the bottom of the screen in an area called the "echo area". The echo area contains the bottom line of the screen.


<a id="org55b6d39"></a>

### MODE LINE

e.g `-:**- TUTORIAL 63% L749 (Fundamental)`


<a id="org3105de8"></a>

### Major modes

e.g. fundamental `C-h m`, To view documentation on your current major mode. `M-x modes you want`


<a id="orgae29c0d"></a>

### Minor modes

e.g. auto fill, `M-x auto-fill-mode`


<a id="orgc6da53a"></a>

### Frames

-   **`C-x 2`:** which splits the screen into two windows
-   **`C-M-v` or `<ESC> C-v`:** scroll down the other window
-   **`C-x o`:** to switch between the windows
-   **`C-x 1`:** kill others except the one I am in
-   **`C-x 3`:** splits the screen into two, vertically
-   **`C-x 4 C-f <file-name>`:** Type `C-x 4 C-f` followed by the name of one of your files. End with `<Return>`. See the specified file appear in the bottom window. The cursor goes there, too.


<a id="org159f5c6"></a>

### RECURSIVE EDITING LEVELS

This is indicated by square brackets in the mode line, surrounding the parentheses around the major mode name. For example, you might see [(Fundamental)] instead of (Fundamental). To get out of the recursive editing level, type `<ESC> <ESC> <ESC>`. You cannot use `C-g` to get out of a recursive editing level. This is because `C-g` is used for canceling commands and arguments **WITHIN** the recursive editing level.


<a id="org6479df7"></a>

### Dired


<a id="org98a5092"></a>

# Emacs client

[EmacsClient](https://www.emacswiki.org/emacs/EmacsClient)


<a id="org33f4268"></a>

## unix-like

In unix-like terminal, you can try

```sh
$emacs --daemon
$emacsclient -c file # open in a window
#emacsclient -t file # open in terminal
```


<a id="orgcbfe0c8"></a>

## windows

In windows, I did not figure out how to open cygwin-built emacs via &#x2013;daemon I can successfully open emacs via &#x2013;daemon with windows-built emacs. Firstly create a shortcut with `c:\path\to\emacs\bin\emacsclientw.exe -c -n -a runemacs.exe`

```sh
$cd /path/to/emacs
$runemacs --daemon
```

Double click the shortcut.


<a id="orgcb5b866"></a>

## kill

```sh
$emacsclient -e '(kill-emacs)' # or try below
$emacsclient -e '(client-save-kill-emacs)'
```


<a id="org47ceec9"></a>

# Org mode

Please consult this [link](https://orgmode.org/orgguide.pdf) (maybe outdated) and [its translation](https://www.cnblogs.com/Open_Source/archive/2011/07/17/2108747.html).


<a id="org34c4d59"></a>

## Outline and document structure

`org-cycle` is bound to `TAB`.


<a id="org1b9e5ba"></a>

### Structure editing

1.  Keyboard with arrows

    -   **`M-RET`:** Insert a new header with the same level as current. On cygwin, `C-<RET>`, otherwise, `M-<RET>`.
    -   **`M-S-RET`:** Insert a new `TODO` entry with same level as current heading.
    -   **`TAB` in new empty entry:** In a new entry with no text yet, `TAB` cycles through reasonable levels.
    -   **`M-LEFT/RIGHT`:** Promote or demote current heading by one level.
    -   **`M-S-LEFT/RIGHT`:** Promote or demote the current heading with its subtree by one level.
    -   **`M-UP/DOWN`:** Swap the current heading and its subtree with previous/next heading of same level.
    -   **`M-S-UP/DOWN`:** Move the current heading upward or downward without moving its subtree, i.e., the headings are swapped without considering their levels.
    -   **`C-c C-w`:** Refile the entry or region to a different location.
    -   **`C-c n s/w`:** Narrow the buffer to the current subtree and widen it again.
    -   **`C-C C-x C-w`:** kill the subtree. With a numeric prefix argument N, kill N sequential subtrees.
    -   **`C-C C-x M-w`:** copy the subtree. With a numeric prefix argument N, kill N sequential subtrees.
    -   **`C-c C-x C-y`:** paste the subtree.

2.  Alternative keys for arrows

    [Using Org on a TTY](https://orgmode.org/manual/TTY-Keys.html)


<a id="org72c9a38"></a>

### Visibility of cycling

-   **`TAB`:** FOLDED->CHILDREN->SUBTREE cycle
-   **`S-TAB` or `C-u TAB`:** OVERVIEW->CONTENTS->SHOWALL cycle
-   **`C-u C-u C-u TAB`:** Show all, including drawers.

When `EMACS` first visits an `Org` file, the global state is set to `OVERVIEW`. It can be configured via `org-startup-folded` or via the keyword `startup`:

```org
#+STARTUP: content
```


<a id="org64fa38a"></a>

### Motion

-   **`C-c C-n`:** next heading
-   **`C-c C-p`:** previous heading
-   **`C-c C-f`:** next heading same level
-   **`C-c C-b`:** previous heading same level
-   **`C-c C-u`:** backward to higher level heading


<a id="org4dace9b"></a>

### Sparse tree

Sparse tree shows selected information in an outline tree and hide others.

-   **`C-c /`:** This prompts for an extra key to select a sparse-tree creating command.
-   **`C-c / r`:** Occur. Prompts for a `regexp` and shows a sparse with all matches. Each match is also highlighted; the highlights disappear by pressing `C-c C-c`.


<a id="org3ed8e2d"></a>

### Plain lists

[Plain-Lists](https://orgmode.org/manual/Plain-Lists.html)

-   Unordered, start with '-', '+' or '\*'
-   Ordered, start with '1.' or '1)' or '[@20]'. Alphabets are allowed, see more on the link.
-   Description, used like `- Elijah Wood :: He plays Frodo`.

Items belonging to the same list must have the same indentation on the first line. An item ends before the next line that is indented like its bullet/number, or less. A list ends when all items are closed, or before two blank lines.

The following commands act on items when point is in the first line of an item (the line with the bullet number).

-   **`TAB`:** Items can be folded just like headline levels.
-   **`M-RET`:** Insert a new item at current level. With a prefix argument, force a new heading.
-   **`M-S-RET`:** Insert a new item with a checkbox.
-   **`M-S-UP/DOWN`:** Move the item including subitems up/down.
-   **`M-LEFT/RIGHT`:** Decrease/increase the indentation of an item, leaving children alone.
-   **`M-S-LEFT/RIGHT`:** Decrease/increase the indentation of the item, including subitems.
-   **`C-c C-c`:** If there is a checkbox in the item line, toggle the state of the checkbox. Also verify bullets and indentation consistency in the whole list.
-   **`C-c -`:** Cycle the entire list level through the different itemize/enumerate bullets ('-','+','\*','1.','1)').


<a id="orga5e0847"></a>

## Table

An example:

```org
| Name  | Phone | Age |
|-------+-------+-----|
| Peter |  1234 |  17 |
| Anna  |  4321 |  25 |
```

A table is re-aligned once you press `TAB`, `RET` or `C-c C-c` inside the table.

Two quick ways to insert a new table. The first is

```org
| Name  | Phone | Age |
|-
```

and then type `TAB`. The second is

```org
| Name  | Phone | Age |
```

and then type `C-c RET`.


<a id="org169a5cc"></a>

### Creation and conversion

-   **`C-c |`:** Convert the active region to table. `TAB` and `comma` would serve as delimiters.


<a id="org292d422"></a>

### Re-aligning and field motion

-   **`C-c C-c`:** Re-align the table without moving point.
-   **`TAB`:** Re-align the table and move to the next field. Creates a new row if necessary.
-   **`S-TAB`:** Re-align and move to the previous field.
-   **`RET`:** Re-align the table and move down to the next row. Creates a new row if necessary.
-   **`S-UP/DOWN/LEFT/RIGHT`:** Move a cell up/down/left/right by swapping with adjacent cell.
-   **`M-LEFT/RIGHT`:** Move the current column left/right.
-   **`M-S-LEFT`:** Kill the current column.
-   **`M-S-RIGHT`:** Insert a new column to the left of point position.
-   **`M-UP,M-DOWN`:** Move the current row up/down.
-   **`M-S-UP`:** Kill the current row or horizontal line.
-   **`M-S-DOWN`:** Insert a new row above the current row. With a prefix argument, the line is created below the current one.
-   **`C-c -`:** Insert a horizontal line below current row. With a prefix argument, the line is created above the current line.
-   **`C-c RET`:** Insert a horizontal line below current row, and move the point into the row below that line.
-   **`C-c ^`:** Sort the table lines in the region.


<a id="org0aaf3df"></a>

## Hyperlinks


<a id="org41af21a"></a>

### Link

`C-c C-l` or `[[link][description]]` or `[link]`. To edit an existing link, put the point upon it and type `C-c C-l`.

1.  Handling links

    Please also see this [link](https://orgmode.org/manual/Handling-Links.html).
    
    `org-store-link` will store a link to the current location. For example, put the `point` under `(provide 'init-org)` in `~/.emacs.d/lisp/init-org.el`. Run this command, you will find the following message.
    
        Stored: file:~/.emacs.d/lisp/init-org.el::(provide 'init-org)
    
    -   **`C-c C-l`:** Insert a link. This prompts for a link to be inserted into the buffer. You can just type a link, or use history keys `UP` (or `M-p`) and `DOWN` (or `M-n`) to acess stored links. You will be prompted for the description part of the link.
    -   **`C-c C-l` (with point on existing link):** When point is on an existing link, `C-c C-l` allows you to edit the link and description parts of the link.
    -   **`C-c C-o`:** Open link at point.
    -   **`C-c &`:** Jump back to a recorded position. A position is recorded by the commands following internal links, and by `C-c %`. Using this command several times in direct succession moves through a ring of previously recorded positions.

2.  Internal links

    If the link is not URL-like, it is considered as an internal link. Two popular styles:
    
    -   **`[[#my-custom-id]]`:** Link the entry with the `CUSTOM_ID` property `my-custom-id`.
    -   **`[[My Target]]` or `[[My Target][Find my target]]`:** Lead to a text search in the current file for the corresponding target, which looks like `<<My Target>>`.

3.  External links

    Please check this [link](https://orgmode.org/manual/External-Links.html).
    
    External links are URL-like locator. They start with a short identifying string followed by a colon. There can be no space after the colon. Here are some examples:
    
    | example                                   | types                            |
    |----------------------------------------- |-------------------------------- |
    | `http://www.astro.uva.nl/=dominik`        | on the web                       |
    | `file:/home/dominik/images/jupiter.jpg`   | file (absolute path)             |
    | `/home/dominik/images/jupiter.jpg`        | same as above                    |
    | `file:papers/last.pdf`                    | file (relative path)             |
    | `./papers/last.pdf`                       | same as above                    |
    | `file:projects.org`                       | another Org file                 |
    | `docview:papers/last.pdf::NNN`            | open in DocView mode at page NNN |
    | `id:B7423F4D-2E8A-471B-8810-C40F074717E9` | link to heading by ID            |
    | `news:comp.emacs`                         | Usenet link                      |
    | `mailto:adent@galaxy.net`                 | mail link                        |
    | `mhe:folder#id`                           | MH-E message link                |
    | `rmail:folder#id`                         | Rmail message link               |
    | `gnus:group#id`                           | Gnus article link                |
    | `bbdb:R.*Stallman`                        | BBDB link (with regexp)          |
    | `irc:/irc.com/#emacs/bob`                 | IRC link                         |
    | `info:org#Hyperlinks`                     | Info node link                   |


<a id="org3593b24"></a>

## `TODO` items


<a id="org24681da"></a>

### Basic functionality

Here is an example: `*** TODO Write letter to Sam Fortune`. Other useful commands are:

-   **`C-c C-t`:** Rotate the `TODO` state of the current item among -> (unmarked) -> TODO -> DONE ->; The same rotation can also be done "remotely" from the agenda buffer with the `t` command key.
-   **`S-RIGHT/LEFT`:** Select the following/preceding `TODO` state, similar to cycling.
-   **`C-c / t`:** View `TODO` items in a *sparse tree*. Folds the entire buffer, but shows all `TODO` items &#x2013; with not-DONE state &#x2013; and the headings hierarchy above them.
-   **`M-x org-agenda t`:** Show the global `TODO` list. Collects the `TODO` items (with not-DONE states) from all agenda files into a single buffer.
-   **`S-M-RET`:** Insert a new `TODO` entry below the current one.

Changing a `TODO` state can also trigger tag changes. See the docstring of the option `org-todo-state-tags-triggers` for details.


<a id="org4f0f387"></a>

### Multi-state workflow

You can use `TODO` keywords to indicate @emph{sequential} working progress states:

```emacs-lisp
(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
```

The vertical bar seperates the `TODO` keywords (*states* that *need action*) from the `DONE` states (which need *no further action*). If you do not provide the seperator bar, the last state is used as the `DONE` state. With this setup, the command `C-c C-t` cycles an entry from `TODO` to `FEEDBACK`, then to `VERIFY`, and finally to `DONE` and `DELEGATED`.

Sometimes you may want to use different sets of `TODO` keywords in parallel. For example, you may want to have the basic `TODO` / `DONE`, but also a workflow for bug fixing. Your setup would then look like this:

```emacs-lisp
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))
```

The keywords should all be different, this helps Org mode to keep track of which subsequence should be used for a given entry. The example also shows how to define keys for fast access of a particular state, by adding a letter in parethesis after each keyword &#x2013; you will be prompted for the key after `C-c C-t`.

To define `TODO` keywords that are valid only in a single file, use the following text anywhere in the file.

```org
#+TODO: TODO(t) | DONE(d)
#+TODO: REPORT(r) BUG(b) KNOWNCAUSE(k) | FIXED (f)
#+TODO: | CANCELED(c)
```

After changing one of these lines, use `C-c C-c` with the cursor still in the line to make the changes known to Org mode.


<a id="orgb124dcd"></a>

### Progress logging

To record a timestamp and a note when changing a `TODO` state, call the command `org-todo` with a prefix argument.

-   **`C-u C-c C-t`:** Prompt for a note and record the time of the `TODO` state change.

1.  Closing items

    `(setq org-log-done 'time)` will help you record the time when an item is closed.
    
    `(setq org-log-done 'note)` will prompt for a note to you.
    
    Or you can use in-buffer setting: `#+STARTUP: logdone`, `#+STARTUP: logenotedone`.
    
    I would like to say here that there is an option that disable logbook. I have the similar issue to the [post](https://www.reddit.com/r/emacs/comments/mlkb9p/cant_disable_logbook_etc_when_marking_todos_as), and the [post](https://www.reddit.com/r/emacs/comments/r9nrwq/comment/hne481v/?utm_source=share&utm_medium=web2x&context=3). I can put
    
        #+STARTUP: nologdone
    
    But it does not stop the logbook creation. I also use configurations from purcell. I do not know which configuration prevent me from disabling the logbook during switch of `TODO` status. I can only put it
    
    ```org
    * Anything text you want to set as headline
    :PROPERTIES:
    :LOGGING:  nologdone
    :END:
    ```
    
    This method does work.
    
    An alternative way is to do like:
    
    ```org
    # -*- org-log-done: nil -*-
    #+STARTUP: nologdone
    #+TODO: TODO(t) | DONE(d)
    ```
    
    I does not know why this works. Maybe it is because:
    
    -   LOGBOOK is enabled after startup by the `!` or `@` options in `TODO` setup
    -   LOGBOOK is enabled after `org-log-done` is set to `t`.
    
    I have to disable the above two together. Then I can disable the LOGBOOK.

2.  Tracking `TODO` state changes

    After taking notes when you close `TODO` items, you want to get the notes out of the way into a drawer. Customize the variable `org-log-into-drawer` to get the behavior.
    
    For state logging, Org mode expects configurations on a per-keyword basis. This is achieved by adding special markers `!` (for a timestamp) and `@` (for a note) in parentheses after each keyword. For example:
    
    ```org
    #+TODO: TODO(t) WAIT(w@/!) | DONE(d!) CANCELED(c@)
    ```
    
    I copy the descriptions from the [reference](https://orgmode.org/manual/Tracking-TODO-state-changes.html#Tracking-TODO-state-changes) guide.
    
    > You not only define global `TODO` keywords and fast access keys, but also request that a time is recorded when the entry is set to `'DONE'`, and that a note is recorded when switching to `'WAIT'` or `'CANCELED'.` The setting for `'WAIT'` is even more special: the `'!'` after the slash means that in addition to the note taken when entering the state, a timestamp should be recorded when *leaving* the `'WAIT'` state, if and only if the *target* state does not configure logging for entering it. So it has no effect when switching from `'WAIT'` to `'DONE'`, because `'DONE'` is configured to record a timestamp only. But when switching from `'WAIT'` back to `'TODO'`, the `'/!'` in the `'WAIT'` setting now triggers a timestamp even though `'TODO'` has no logging configured.


<a id="org3704dbf"></a>

### Priorities

A headline with `priority cookie` will look like:

```org
*** TODO [#A] Write letter to Sam Fortune
```

Priorities are ordered from A to C. A is the highest and B is the default if none is given.

-   `C-c ,` Set the priority of the current headline.
-   `S-UP/DOWN`, Increase/decrease the priority of the current headline.


<a id="org29e0bf0"></a>

### Breaking tasks down into subtasks

Append `[/]` or `[%]` to the `TODO` item will enable this feature. After typing `C-c C-c` when the point under `[]`, you will have the cookie updated. An example shown here.

```org
* Organize Party [%]
** TODO Call people [/]
*** TODO Peter
*** DONE Sarah
** TODO Buy food
** DONE Talk to neighbor
```

After `C-c C-c`, it will become:

```org
* Organize Party [33%]
** TODO Call people [1/2]
*** TODO Peter
*** DONE Sarah
** TODO Buy food
** DONE Talk to neighbor
```


<a id="org23a43f1"></a>

### Checkboxes

Checkboxes are used in plain lists. They help you split a `TODO` item into several steps. They are not included in the global `TODO` list. Here is an example:

```org
* TODO Organize party [/]
  - [ ] call people [/]
    - [ ] Peter
    - [ ] Sarah
  - [ ] order food
```

After typing `C-c C-c` when point under cookies,

```org
* TODO Organize party [1/2]
  - [-] call people [1/2]
    - [ ] Peter
    - [X] Sarah
  - [X] order food
```

User commands are:

-   **`C-c C-c`:** Toggle checkbox status or &#x2013; with prefix argument &#x2013; checkbox presence at point.
-   **`M-S-RET`:** Insert a new item with a checkbox when the point is already in a plain list item.


<a id="org1318532"></a>

## Tags

Tags are normal words containing letters, numbers, `-` and `@`. And they must be preceded by and followed by a single colon, e.g., `:work:`. Several tags can be specified, as in `:work:urgen:`.


<a id="org111ebf1"></a>

### Tag inheritance

If a heading has a certain tag, all subheadings inherit the tag as well. Here is an example:

```org
* Meeting with the French group    :work:
** Summary by Frank                :boss:notes:
*** TODO Prepare slides for him    :action:    
```

You can set tags inherited by all entries in a file:

```org
#+FILETAGS: :Peter:Boss:Secret:
```


<a id="orgbc4baac"></a>

### Setting tags

Useful keybindings:

-   **`M-TAB` after a colon:** Offer completion on tags.
-   **`C-c C-q`:** Enter new tags for the ccurrent headline.
-   **`C-c C-c`:** When point is in a headline, this does the same as `C-c C-q`.

Org supports tag insertion based on a *list of tags*. By default this list is constructed dynamically, containing all tags currently used in the buffer. You may also globally specify a hard list of tags with the variable `org-list-alist`. Finally you can set the default tags for a given file using the `TAGS` keyword, like

```org
#+TAGS: @work @home @tennisclub
#+TAGS: laptop car pc sailboat
```

Do not forget to type `C-c C-c` to make them take effects.

You can assign characters to most common tags by configuring `org-tag-alist` in `init` file and make use of *fast tag selection* technique. Here is an example

    (setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))

Or locally set up in the file you are editing

    #+TAGS: @work(w) @home(h) @tennisclub(t) laptop(l) pc(p)


<a id="org94df8a8"></a>

### Tag groups

Tag group can be seen as the "broader term" for its set of tags. It can be constructed via `[]` and `{}`. Examples

    #+TAGS: [ GTD : Contrl Persp ]

or

    #+TAGS: { Context : @Home @Work }

When you search for a group tag, it returns matches for all members in the group and its subgroups. In an agenda view, filtering by a group tag displays or hide headlines tagged with at least one of the members of the group or any of its subgroups.

If you want to ignore group tags temporarily, toggle group tags support with `org-toggle-tags-groups`, bound to `C-c C-x q`.


<a id="org9cfce5e"></a>

### Tag searches

-   **`C-c / m` or `C-c \`:** Create a sparse tree with all headlines matching a tags search. With a `C-u` prefix argument, ignore headlines that are not a `TODO` line.
-   **`M-x org-agenda m`:** Createe a global list of tag matches from all agenda files.
-   **`M-x org-agenda M`:** Create a global list of tag matches from all agenda files, but check only `TODO` items and force checking subitems.

These commands all prompt for a match string which allows basic `Boolean` logic like `+boss+urgent-project1`, to find entries with tags `boss` and `urgent`, but not `project1`; `Kathy|Sally` to find entries which are tagged like `Kathy` or `Sally`.


<a id="orgac74594"></a>

## Properties

Properties begin with `:PROPERTIES:` and end with `:END:`. Here is an example

```org
* CD Collection
** Classic
*** Goldberg Variations
    :PROPERTIES:
    :TITLE:     Goldberg Variations
    :Composer:  J. S. Bach
    :Publisher: Deutsche Grammophon
    :NDisks:
    :END:
```

You may define the allowed values for a particular property `Xyz` by setting a property `Xyz_ALL`. This special property is `inherited`, so if you set it in a level 1 entry, it applies to the entire tree. When allowed values are defined, setting the corresponding property becomes easier and is less prone to typing errors. For the example of the CD collection, we can pre-define publishers and the number of disks in a box like this:

```org
* CD collections
  :PROPERTIES: 
  :NDisks_ALL: 1 2 3 4
  :Publisher_ALL: "Deutsche Grammophon" Philips EMI
  :END:
```

If you want to set properties that can be inherited by any entry in a file, use a line like :#+PROPERTY: NDisks<sub>ALL</sub> 1 2 3 4

Useful commands:

-   **`C-c C-x p`:** Set a property.
-   **`C-c C-c d`:** Remove a property.


<a id="orgca3d95d"></a>

## Dates and times


<a id="org6fdca3d"></a>

### Timestamps

Please check this [link](https://orgmode.org/manual/Timestamps.html).


<a id="org786565f"></a>

### Creating timestamps

Useful commands:

-   **`C-c .`:** Prompt for a date and insert a corresponding timestamp. When point is at an existing timestamp in the buffer, the command is used to modify this timestamp instead of inserting a new one. When this command is used twice in succession, a time range is inserted. With a prefix argument, it also adds the current time.
-   **`C-c !`:** Like `C-c .`, but it insert an inactive timestamp that does not cause an agenda entry.
-   **`S-LEFT/RIGHT`:** Change the date at point by one day.
-   **`S-UP/DOWN`:** On the beginning or enclosing bracket of a timestamp, change its type. Within a timestamp, change the item under point. Point can be on a year, month, day, hour or minute. When the timestamp contains a time range like '15:30-16:30', modifying the first time also shifts the second, shifting the time block with constant length. To change the length, modify the second time.

When Org mode prompts for a date/time, it accepts any string containing some date and/or time information, and intelligently interprets the string, deriving defaults for unspecified information from the current date and time. You can also select a date in the pop-up calendar.


<a id="org3bddae4"></a>

### Deadlines and Scheduling

A timestamp may be preceded by special keywords to facilitate planning:

-   **`C-c C-d`:** Insert "DEADLINE" keyword along with a time stamp, in the line following the headline.
    
    On the deadline date, the task is listed in the agenda. In addtion, the agenda for *today* carries a warning about the approaching or missed deadline, starting `org-deadline-warning-days` before the due date, and continuing until the entry is marked as done.

-   **`C-c C-s`:** Insert "SCHEDULED" keyword along with a stamp, in the line following the headline.
    
    The headlin is listed under the given date. In addition, a reminder that the scheduled date has passed is present in the compilation for *today*, until the entry is marked as done, i.e., the task is automatically forwarded until completed.

Repeaters can also be used in "DEADLINE" and "SCHEDULED", as in "timestamp". Examples are below:

```org
** TODO Pay the rent
   DEADLINE: <2005-10-01 Sat +1m>
```

It means the task repeats every one month (`1m`) from that time.


<a id="orgdc0ac94"></a>

### Clocking work time

To clock the time you spend on the tasks in a project.

-   **`C-c C-x C-i`:** Start the clock on the current item (clock-in). This inserts the 'CLOCK' keyword together with a timestamp. When called with a `C-u` prefix argument, select the task from a list of recently clocked tasks. See `M-x org-clock-in` and `M-x org-clock-in-last`. These two functions are re-mapped to `C-c o i` and `C-c o l` (purcell emacs).
-   **`C-c C-x C-o`:** Stop the clock (clock-out). This inserts another timestamp at the same location where the clock was last started. It also directly computes the resulting time in inserts it after the time range as `=>HH:MM`. This functionality is also bound to `C-c o o` (purcell emacs).
-   **`C-c C-x C-e`:** Update the effort estimate for the current clock task.
-   **`C-c C-x C-q`:** Cancel the current clock. This is useful if a clock was started by mistake, or if you ended up working on something else.
-   **`C-c C-x j`:** Jump to the headline of the currently clocked in task. With a `C-u` prefix argument, select the target task from a list of recently clocked tasks. This functionality is bound to `C-c o j` (purcell emacs).


<a id="org736e790"></a>

## Capture, refile and archive


<a id="orgd517542"></a>

### Capture

1.  Setting up capture

    An example of customizing the default target file:
    
        (setq org-default-notes-file (concat org-directory "~/notes.org"))
    
    An example of customizing the keybinding of `org-capture`:
    
        (global-set-key (kbd "C-c c") 'org-capture) ;; used by purcell emacs

2.  Using capture

    -   **`M-x org-capture`:** Start a capture process, placing you into a narrowed indirect buffer to edit.
    -   **`C-c C-c`:** Once you have finished entering information into the capture buffer, `C-c C-c` returns you to the window configuration before the capture process, so that you can resume your work without further distraction.
    -   **`C-c C-w`:** Finalize the capture process by refiling the note to a different place.
    -   **`C-c C-k`:** Abort the capture process and return to the previous state.

3.  Capture templates

    Please check this [link](https://orgmode.org/manual/Capture-templates.html).
    
    I took an example from purcell-emacs:
    
    ```emacs-lisp
    (setq org-capture-templates
          `(("t" "todo" entry (file "")  ; "" => `org-default-notes-file'
             "* NEXT %?\n%U\n" :clock-resume t)
            ("n" "note" entry (file "")
             "* %? :NOTE:\n%U\n%a\n" :clock-resume t)
            ))
    ```
    
    Here are some tips:
    
    | Shortcuts    | Explainations                                               |
    |------------ |----------------------------------------------------------- |
    | '%a'         | annotation, normally the link created with org-store-link   |
    | '%i'         | initial content, the region when capture is called with C-u |
    | '%t', '%T'   | timestamp, date only, or date and time                      |
    | '%u', '%U'   | like above, but inactive timestamps                         |
    | '%?'         | after completing the template, position point here          |
    | clock-resume | Start the interrupted clock when finishing the capture.     |
    
    Captured contents will be sent to `org-default-notes-file`.

4.  Refile and copy

    Useful keybindings:
    
    -   **`C-c C-w`:** Refile the entry or region at point. This command offers possible locations for refiling the entry and lets you select one with completion. The item (or all items in the region) is filed below the target heading as a subitem.
        
        By default, all level 1 headlines in the current buffer are considered to be targets, but you can have more complex definitions across a number of files. See the variable `org-refile-targets` for details.
    
    -   **`C-u C-c C-w`:** Use the refile interface to jump to a heading.
    
    -   **`C-u C-u- C-c C-w`:** Jump to the location where `org-refile` last moved a tree to.
    
    -   **`C-c M-w`:** Copying works like refiling, except that the original note is not deleted.

5.  Archiving

    You want to archive a project when you do not want it to contribute the agenda since it is finished.
    
    Useful commands:
    
    -   **`C-c C-x C-a`:** Archive the current entry using the command specified in the variable `org-archive-default-command`.
    -   **`C-c C-x C-s` or short `C-c $`:** Archive the subtree at point position to the location given by org-archive-location.
    
    The default location is a file in the same directory as the current file, with the name derived by appending `_archive` to the current file name. You can also choose what heading to file archived items under, with the possibility to add them to a datetree in a file. For information and examples on how to specify the file and the heading, see documentation string of the variable `org-archive-location`.
    
    There is also an in-buffer option for setting this variable, for example:
    
        #+ARCHIVE: %s_done::


<a id="orgb803f80"></a>

## Agenda Views


<a id="orgf595b05"></a>

### Agenda files

The information to be shown is normally collected from all agenda files, the files listed in the variable `org-agenda-files`.

-   **`C-c [`:** Add current file to the list of agenda files. The file is added to the front of the list. If it was already in the list, it is moved to the front. With a prefix argument, file is added/moved to the end.
-   **`C-c ]`:** remove the current file from the list of agenda files.
-   **`C-'` and `C-,`:** Cycle through agenda file list, visting one file after the other.


<a id="org3c7266b"></a>

### The agenda dispatcher

The views are created through a dispatcher, accessible with `M-x org-agenda`, or, better, bound to a global key (`C-c a` in purcell emacs). It displays a menu from which an additional letter is required to execute a command. The dispatcher offers the following default commands:

-   **a:** Create the calendar-like agenda
-   **t or T:** Create a list of TODO items
-   **m or M:** Create a list of headlines matching a given expression
-   **s:** Create a list of entries selected by a boolean expression of keywords and/or regular expressions that must or must not occur in the entry.


<a id="org88e8a79"></a>

### The weekly/daily agenda

-   **`M-x org-agenda a`:** Compile an agenda for the current week from a list of Org files. The agenda shows the entries for each day.

Org mode understands the syntax of the diary and allows you to use diary expression entries directly in Org files:

```org
* Holidays
  :PROPERTIES:
  :CATEGORY: Holiday
  :END:
%%(org-calendar-holiday)    ; special function for holiday names

* Birthday
  :PROPERTIES:
  :CATEGORY: Ann
  :END:
%%(org-anniversary 1956 5 14) Arthur Dent is %d years old
%%(org-anniversary 1896 10 2) Mahatma Gandhi would %d years old
```

Or can interact with Emacs appointments notification facility. To add the appointments of your agenda files, use the command `org-agenda-to-appt`.


<a id="orge8250a2"></a>

### The global TODO list

Useful keybinds:

-   **`M-x org-agenda t`:** Show the global TODO list. This collects the TODO items from all agenda files into a single buffer.
-   **`M-x org-agenda T`:** Like the above, but allows selection of a specific TODO keyword.


<a id="org5bb0912"></a>

### Matching tags and properties

You can select headlines with specific tags and properties and collect them into an agenda buffer. The match syntax described here also applies when creating sparse trees with `C-c / m`.

-   **`M-x org-agenda m`:** Produce a list of all headlines that match a given set of tags. The command prompts for a selection criterion, which is a boolean logic expression with tags, like `+work+urgent-withboss` or `work|home`. If you often need a specific search, define a custom command for it.
-   **M-x org-agenda M:** Like `m`, but only select headlines that are also TODO items.

A search string can use Boolean operators `&` for AND and `|` for OR. `&` binds more strongly than `|`. Parentheses are currently not implemented. Each element in the search is either a tag, a regular expression matching tags, or an expression like `PROPERTY OPERATOR VALUE` with a comparison operator, accessing a property value. Each element may be preceded by `-` to select against it, and `+` is syntactic sugar for positive selection. The AND operator `&` is optional when `+` or `-` is present. Here are some examples, using only tags.

-   **`+work-boss`:** Select headlines tagged `work`, but discard those also tagged `boss`.
-   **`work|laptop`:** Selects lines tagged `work` or `laptop`.
-   **`work|laptop+night`:** Like before, but require `laptop` lines to be tagged also `night`.


<a id="org2cb988b"></a>

### Search view

-   **`M-x org-agenda s` or `M-x org-search-view`:** This is a special search that lets you select entries by matching a substring or specific words using a boolean logic.

Search view can also search for specific keywords in the entry, using boolean logic. The search string `+computer+wifi-ethernet-{8\.11[bg]}` matches note entries that contain the keywords `computer` and `wifi`, but not the keyword `ethernet`, and which are also not matched by the regular expression `8\.11[bg]`, meaning to exclude both `8.11b` and `8.11g`.

not that in addition to the agenda file, this command also searches the files listed in `org-agenda-text-search-extra-files`.


<a id="org9e20726"></a>

### Commands in the agenda buffer.

1.  Motion

    -   **`n`:** Next line (same as `DOWN` and `C-n`).
    -   **`p`:** Previous line (same as `UP` and `C-p`).

2.  View/Go to Org file

    -   **`SPC`:** Display the original location of the item in another window. With a prefix argument, make sure that drawers staty folded.
    -   **`TAB`:** Go to the original location of the item in another window.
    -   **`RET`:** Go to the original location of the item and delete other window.

3.  Change display

    -   **`o`:** Delete other windows.
    -   **`v d` or short `d`:** Switch to day view.
    -   **`v w` or short `w`:** Switch to week view.
    -   **`f`:** Go forward in time to display the *span* following the current one. For example, if the display covers a week, switch to the following week.
    -   **`b`:** Go backward in time to display earlier dates.
    -   **`.`:** Go to today.
    -   **`j`:** Prompt for a date and go there.
    -   **`v l` or `v L` or short `l`:** Toggle Logbook mode. In Logbook mode, entries that were marked as done while logging was on (see the varaible `org-log-done`) are shown in the agenda, as are entries that have been clocked on that day. When called with a `C-u` prefix argument, show all possible logbook entries, including state changes.
    -   **`r` / `g`:** Recreate the agenda buffer, for example to reflect the changes after modification of the timestamps of items.
    -   **`s`:** Save all Org buffers in the current Emacs session, and also the locations of IDs.

4.  Remote editing

    -   **`0--9`:** Digit argument
    -   **`t`:** Change the TODO state of the item, both in the agenda and in the original Org file.
    -   **`C-k`:** Delete the current agenda item along with the entire subtree belonging to it in the original Org file.
    -   **`C-c C-w`:** Refile the entry at point.
    -   **`a`:** Archive the subtree corresponding to the entry at point using the default archiving command set in `org-archive-default-command`.
    -   **`$`:** Archive the subtree corresponding to the current headline.
    -   **`C-c C-s`:** Schedule this item. With a prefix argument, remove the scheduling timestamp
    -   **`C-c C-d`:** Set a deadline for this item. With a prefix argument, remove the deadline.
    -   **`S-RIGHT`:** Change the timestamp associated with the current line by one day into the future.
    -   **`S-LEFT`:** Change the timestamp associated with the current line by one day into the past.
    -   **`I`:** Start the clock on the current item.
    -   **`O`:** Stop the previously started clock.
    -   **`X`:** Cancel the currently running clock.
    -   **`J`:** Jump to the running clock in another window.

5.  Quit and exit

    -   **`q`:** Quit agenda, remove the agenda buffer.
    -   **`x`:** Exit agenda, remove the agenda buffer and all buffers loaded by Emacs for the compilation of the agenda.

6.  Custom agenda views

    The first application of custom searches is the definition of keyboard shortcuts for frequently used searches, either creating an agenda buffer, or a sparse tree (the latter covering of course only the current buffer).
    
    Custom commands are configured in the variable `org-agenda-custom-commands`. You can customize this variable, for example by pressing `C` from the agenda dispatcher. You can also directly set it with Emacs Lisp in the Emacs init file. The following example contains all valid agenda views:
    
    ```emacs-lisp
    (setq org-agenda-custom-commands
          '(("w" todo "WAITING")
            ("u" tags "+boss-urgent")
            ("v" tags-todo "+boss-urgent")))
    ```
    
    The initial string in each entry defines the keys you have to press after the dispatcher command in order to access the command. Usually this is just a single character. The second parameter is the search type, followed by the string or regular expression to be used for the matching. The example above will therefore define:
    
    -   **`w`:** as a global search for TODO entries with `WAITING` as the TODO keyword.
    -   **`u`:** as a global tags search for headlines tagged 'boss' but not 'urgent'.
    -   **`v`:** The same search, but limiting it to headlines that are also TODO items.


<a id="org333db7e"></a>

## Code blocks

[CodeBlocks](https://orgmode.org/manual/Structure-of-Code-Blocks.html),


<a id="orgfef999b"></a>

### Inline

you can also use ~~ and == for inline codes.


<a id="orgfc3661c"></a>

### Structure templates

[StructureTemplates](https://orgmode.org/manual/Structure-Templates.html#Structure-Templates) `C-c C-,`


<a id="org5d7354f"></a>

### Evaluating code blocks

[link](https://orgmode.org/manual/Evaluating-Code-Blocks.html)


<a id="orgb62ce08"></a>

## Export


<a id="org2b8ebef"></a>

### Commands

`C-c C-e` and then other options.


<a id="org942f09a"></a>

### Code blocks

[Languages](https://orgmode.org/manual/Languages.html#Languages) and [Header arguments](https://orgmode.org/manual/Using-Header-Arguments.html#Using-Header-Arguments).

-   inline, use `=%s=` or `src_<language>[header arguments]{codes}`. A useful example, `src_latex[:exports code]{$\alpha$}`.
-   Use `#+begin_src <language>[<header arguments>]{<body>} #+end_src` and `[header arguments]` is optional. To insert these, use `C-c, C-,`.


<a id="org249f27d"></a>

### Latex

Here are examples

1.  Normally insert latex codes

```latex
The radius of the sun is R_sun = 6.96 x 10^8 m.  On the other
hand, the radius of Alpha Centauri is R_{Alpha Centauri} = 1.28 x
R_{sun}.

\begin{equation}                        % arbitrary environments,
x=\sqrt{b}                              % even tables, figures
\end{equation}                          % etc

If $a^2=b$ and \( b=2 \), then the solution must be
either $$ a=+\sqrt{2} $$ or \[ a=-\sqrt{2} \].
```

1.  Headers and sectioning structures, [link](https://orgmode.org/manual/LaTeX-header-and-sectioning.html)
    
    ```org
    #+LATEX_CLASS_OPTIONS: [a4paper,11pt,twoside,twocolumn]
    #+LATEX_CLASS: article
    #+LATEX_CLASS_OPTIONS: [a4paper]
    #+LATEX_HEADER: \usepackage{xyz}
    * Headline 1
      some text
    * Headline 2
      some more text
    ```
2.  Quoting, [link](https://orgmode.org/manual/Quoting-LaTeX-code.html#Quoting-LaTeX-code)
    -   Inserting in-line quoted with @ symbols: `Code embedded in-line @@latex:any arbitrary LaTeX code@@ in a paragraph.`
    -   Inserting as one or more keyword lines in the Org file: `#+LATEX: any arbitrary LaTeX code`
    -   Inserting as an export block in the Org file, where the back-end exports any code between begin and end markers:
        
        ```org
        #+BEGIN_EXPORT latex
          any arbitrary LaTeX code
        #+END_EXPORT
        ```


<a id="orgab34991"></a>

### Publish a project of HTML

I learn these stuffs from this [tutorial](https://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html).

Basically, you need to do two things:

-   configure the command `org-publish` using `elisp`. This can be done in `*scratch*` page, or in ORG buffer. Please consult this [thread](https://www.mail-archive.com/emacs-orgmode@gnu.org/msg110355.html) for the later case.
-   execute `org-publish` related commands to publish the project.

Let us say how to configure `org-publish`. You need to write `elisp` code like:

```elisp
(require 'ox-publish)
(setq org-publish-project-alist
      '(

       ;; ... all the components ...

      ))
```

In the main body, you can add

```elisp
("org-notes"
 :base-directory "~/org/"
 :base-extension "org"
 :publishing-directory "~/public_html/"
 :recursive t
 :publishing-function org-html-publish-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 )
```

and

```elisp
("org-static"
 :base-directory "~/org/"
 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
 :publishing-directory "~/public_html/"
 :recursive t
 :publishing-function org-publish-attachment
 )
```

and

```elisp
("org" :components ("org-notes" "org-static"))
```

This components will do

-   export the files with extension `.org` under `~/org/` to HTMLs under `~/public_html/` *recursively*, via `org-html-publish-to-html`.
-   copy files with extensions of `css`, `js`, `png`, `jpg`, `gif`, `pdf`, `mp3`, `ogg`, and `swf` under `~/org/` to the directory `~/public_html/` *recursively*, via `org-publish-attachment`
-   Make sure these two componenets are executed in one command.

There are also other setups. Please refer to the [tutorial](https://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html).


<a id="org5808f5a"></a>

## Paragraphs

Paragraphs are separated by at least one empty line. Regarding formats: VERSE, QUOTE and CENTER, details can be found in [Paragraphs](https://orgmode.org/guide/Paragraphs.html#Paragraphs).


<a id="org1a7842d"></a>

# Compilation


<a id="orgcc6f2e2"></a>

## C++


<a id="org62228fc"></a>

### Simplest codes

`M-x compile` and then clean commands, type in `g++ hello_world.cpp`.


<a id="org1c0b6a2"></a>

### Makefile exists

`M-x compile` and then `make`.


<a id="orgee56e9a"></a>

# TRAMP


<a id="org95a6048"></a>

## cleanup

[Cleanup-remote-connections](https://www.gnu.org/software/emacs/manual/html_node/tramp/Cleanup-remote-connections.html)

-   `tramp-cleanup-connection`
-   `tramp-cleanup-this-connection`
-   `tramp-cleanup-all-connections`
-   `tramp-cleanup-all-buffers`


<a id="org2130c1f"></a>

# Miscellaneous


<a id="org23e94d1"></a>

## Font Lock mode

Please check this [wiki](https://www.emacswiki.org/emacs/FontLockMode) link. In a nutshell, it is a minor mode helping highlight the file according to the programming syntaxes.


<a id="orgd6feec4"></a>

## Insert the current date to the current buffer

`C-u M-! date`. See more in the [link](https://www.emacswiki.org/emacs/InsertingTodaysDate) and [link](https://stackoverflow.com/questions/251908/how-can-i-insert-current-date-and-time-into-a-file-using-emacs).


<a id="orgb46cc8c"></a>

## Define a new keybinidng

I read this [link](https://stackoverflow.com/questions/906368/what-is-the-difference-between-global-set-key-and-define-key-global-map-in-e). Please consult the [guide](https://www.gnu.org/software/emacs/manual/html_node/elisp/Changing-Key-Bindings.html) for further information.

-   `global-set-key` helps you define keybindings globally. The two examples below serve the similar functionality.
    
    ```emacs-lisp
    (global-set-key "\C-cl" 'org-store-link)
    (global-set-key (kbd "C-c l" 'org-store-link))
    ```
-   `define-key`, I show an example here. It is taken from the [purcell-emacs](https://github.com/purcell/emacs.d/blob/master/lisp/init-org.el).
    
    ```emacs-lisp
    (define-key org-mode-map (kbd "C-M-<up>"))
    ```


<a id="org5bbc1c1"></a>

## Desktop


<a id="org835b288"></a>

### bookmark

'desktop-path' is searched to find a desktop file to load. if you use Bookmark+, then you have any number of desktops and use them as bookmarks, jumping from one to another at anytime. You create a desktop bookmark using `C-x r K` (command 'bmkp-set-desktop-bookmark')


<a id="orgc7b3e28"></a>

## Rescure a frozen emacs

Please check the corresponding section in `linux.org`.
