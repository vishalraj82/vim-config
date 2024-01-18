" Enables no compatibility with "vi" editor
set nocompatible

" Enable plugins
call plug#begin('~/.vim/plugged')
    Plug 'jiangmiao/auto-pairs'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

" Number of spaces that a <Tab> in the file counts for.  Also see
" |:retab| command, and 'softtabstop' option.
" 
" Note: Setting 'tabstop' to any other value than 8 can make your file
" appear wrong in many places (e.g., when printing it).
" 
" There are four main ways to use tabs in Vim:
" 1. Always keep 'tabstop' at 8, set 'softtabstop' and 'shiftwidth' to 4
"    (or 3 or whatever you prefer) and use 'noexpandtab'.  Then Vim
"    will use a mix of tabs and spaces, but typing <Tab> and <BS> will
"    behave like a tab appears every 4 (or 3) characters.
" 2. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use
"    'expandtab'.  This way you will always insert spaces.  The
"    formatting will never be messed up when 'tabstop' is changed.
" 3. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use a
"    |modeline| to set these values when editing the file again.  Only
"    works when using Vim to edit the file.
" 4. Always set 'tabstop' and 'shiftwidth' to the same value, and
"    'noexpandtab'.  This should then work (for initial indents only)
"    for any tabstop setting that people use.  It might be nice to have
"    tabs after the first non-blank inserted as spaces if you do this
"    though.  Otherwise aligned comments will be wrong when 'tabstop' is
"    changed.
" 
" If Vim is compiled with the |+vartabs| feature then the value of
" 'tabstop' will be ignored if |'vartabstop'| is set to anything other
set tabstop=4

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.  It "feels" like
" <Tab>s are being inserted, while in fact a mix of spaces and <Tab>s is
" used.  This is useful to keep the 'ts' setting at its standard value
" of 8, while being able to edit like it is set to 'sts'.  However,
" commands like "x" still work on the actual characters.
" When 'sts' is zero, this feature is off.
" When 'sts' is negative, the value of 'shiftwidth' is used.
" 'softtabstop' is set to 0 when the 'paste' option is set and restored
" when 'paste' is reset.
" See also |ins-expandtab|.  When 'expandtab' is not set, the number of
" spaces is minimized by using <Tab>s.
" The 'L' flag in 'cpoptions' changes how tabs are used when 'list' is set
set softtabstop=4

" Returns the effective value of 'shiftwidth'. This is the
" 'shiftwidth' value unless it is zero, in which case it is the
" 'tabstop' value.  This function was introduced with patch
" 7.3.694 in 2012, everybody should have it by now (however it
" did not allow for the optional {col} argument until 8.1.542).
" 
" When there is one argument {col} this is used as column number
" for which to return the 'shiftwidth' value. This matters for the
" 'vartabstop' feature. If the 'vartabstop' setting is enabled and
" no {col} argument is given, column 1 will be assumed.
set shiftwidth=4

" In Insert mode: Use the appropriate number of spaces to insert a
" <Tab>.  Spaces are used in indents with the '>' and '<' commands and
" when 'autoindent' is on.  To insert a real tab when 'expandtab' is
" on, use CTRL-V<Tab>.  See also |:retab| and |ins-expandtab|.
" This option is reset when the 'paste' option is set and restored when
" the 'paste' option is reset.
" NOTE: This option is reset when 'compatible' is set.
set expandtab

" Copy indent from current line when starting a new line (typing <CR>
" in Insert mode or when using the "o" or "O" command).  If you do not
" type anything on the new line except <BS> or CTRL-D and then type
" <Esc>, CTRL-O or <CR>, the indent is deleted again.  Moving the cursor
" to another line has the same effect, unless the 'I' flag is included
" in 'cpoptions'.
" When autoindent is on, formatting (with the "gq" command or when you
" reach 'textwidth' in Insert mode) uses the indentation of the first
" line.
" When 'smartindent' or 'cindent' is on the indent is changed in
" a different way.
" The 'autoindent' option is reset when the 'paste' option is set and
" restored when 'paste' is reset.
set autoindent

" Do smart autoindenting when starting a new line.  Works for C-like
" programs, but can also be used for other languages.  'cindent' does
" something like this, works better in most cases, but is more strict,
" see |C-indenting|.  When 'cindent' is on or 'indentexpr' is set,
" setting 'si' has no effect.  'indentexpr' is a more advanced
" alternative.
" Normally 'autoindent' should also be on when using 'smartindent'.
" An indent is automatically inserted:
" - After a line ending in '{'.
" - After a line starting with a keyword from 'cinwords'.
" - Before a line starting with '}' (only with the "O" command).
" When typing '}' as the first character in a new line, that line is
" given the same indent as the matching '{'.
" When typing '#' as the first character in a new line, the indent for
" that line is removed, the '#' is put in the first column.  The indent
" is restored for the next line.  If you don't want this, use this
" mapping: ":inoremap # X^H#", where ^H is entered with CTRL-V CTRL-H.
" When using the ">>" command, lines starting with '#' are not shifted
" right.
" NOTE: This option is reset when 'compatible' is set.
" This option is reset when 'paste' is set and restored when 'paste' is
" reset.
set smartindent

" This option changes how text is displayed.  It doesn't change the text
" in the buffer, see 'textwidth' for that.
" When on, lines longer than the width of the window will wrap and
" displaying continues on the next line.  When off lines will not wrap
" and only part of long lines will be displayed.  When the cursor is
" moved to a part that is not shown, the screen will scroll
" horizontally.
" The line will be broken in the middle of a word if necessary.  See
" 'linebreak' to get the break at a word boundary.
" To make scrolling horizontally a bit more useful, try this: >
"    :set sidescroll=5
"    :set listchars+=precedes:<,extends:>
" <	See 'sidescroll', 'listchars' and |wrap-off|.
" This option can't be set from a |modeline| when the 'diff' option is
" on.
set wrap

" If on, Vim will wrap long lines at a character in 'breakat' rather
" than at the last character that fits on the screen.  Unlike
" 'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
" it only affects the way the file is displayed, not its contents.
" If 'breakindent' is set, line is visually indented. Then, the value
" of 'showbreak' is used to put in front of wrapped lines. This option
" is not used when the 'wrap' option is off.
" Note that <Tab> characters after an <EOL> are mostly not displayed
" with the right amount of white space.
set linebreak

" Enable numbering 
set number

" Show (partial) command in the last line of the screen.  Set this
" option off if your terminal is slow.
" In Visual mode the size of the selected area is shown:
" - When selecting characters within a line, the number of characters.
"   If the number of bytes is different it is also displayed: "2-6"
"   means two characters and six bytes.
" - When selecting more than one line, the number of lines.
" - When selecting a block, the size in screen characters:
"   {lines}x{columns}.
" NOTE: This option is set to the Vi default value when 'compatible' is
" set and to the Vim default value when 'compatible' is reset.
set showcmd

" When this option is set, the screen will not be redrawn while
" executing macros, registers and other commands that have not been
" typed.  Also, updating the window title is postponed.  To force an
" update use |:redraw|.
set lazyredraw

" When a bracket is inserted, briefly jump to the matching one.  The
" jump is only done if the match can be seen on the screen.  The time to
" show the match can be set with 'matchtime'.
" A Beep is given if there is no match (no matter if the match can be
" seen or not).
" This option is reset when 'paste' is set and restored when 'paste' is
" reset.
" When the 'm' flag is not included in 'cpoptions', typing a character
" will immediately move the cursor back to where it belongs.
" See the "sm" field in 'guicursor' for setting the cursor shape and
" blinking when showing the match.
" The 'matchpairs' option can be used to specify the characters to show
" matches for.  'rightleft' and 'revins' are used to look for opposite
" matches.
" Also see the matchparen plugin for highlighting the match when moving
" around |pi_paren.txt|.
set showmatch

" Round indent to multiple of 'shiftwidth'.  Applies to > and <
" commands.  CTRL-T and CTRL-D in Insert mode always round the indent to
" a multiple of 'shiftwidth' (this is Vi compatible).
" NOTE: This option is reset when 'compatible' is set.
set noshiftround


" If in Insert, Replace or Visual mode put a message on the last line.
" Use the 'M' flag in 'highlight' to set the type of highlighting for
" this message.
" When XIM may be used the message will include "XIM".  But this
" doesn't mean XIM is really active, especially when 'imactivatekey' is
" not set.
" NOTE: This option is set to the Vi default value when 'compatible' is
" set and to the Vim default value when 'compatible' is reset.
set showmode

" When 'wildmenu' is on, command-line completion operates in an enhanced
" mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
" the possible matches are shown just above the command line, with the
" first match highlighted (overwriting the status line, if there is
" one).  Keys that show the previous/next match, such as <Tab> or
" CTRL-P/CTRL-N, cause the highlight to move to the appropriate match.
" When 'wildmode' is used, "wildmenu" mode is used where "full" is
" specified.  "longest" and "list" do not start "wildmenu" mode.
" You can check the current mode with wildmenumode().
" If there are more matches than can fit in the line, a ">" is shown on
" the right and/or a "<" is shown on the left.  The status line scrolls
" as needed.
" The "wildmenu" mode is abandoned when a key is hit that is not used
" for selecting a completion.
set wildmenu

" Completion mode that is used for the character specified with
" 'wildchar'.  It is a comma separated list of up to four parts.  Each
" part specifies what to do for each consecutive use of 'wildchar'.  The
" first part specifies the behavior for the first use of 'wildchar',
" The second part for the second use, etc.
" 
" Each part consists of a colon separated list consisting of the
" following possible values:
" ""		Complete only the first match.
" "full"		Complete the next full match.  After the last match,
"        the original string is used and then the first match
"        again.  Will also start 'wildmenu' if it is enabled.
"longest"	Complete till longest common string.  If this doesn't
"        result in a longer string, use the next part.
"list"		When more than one match, list all matches.
"lastused"	When completing buffer names and more than one buffer
"        matches, sort buffers by time last used (other than
"        the current buffer).
" When there is only a single match, it is fully completed in all cases.
"  
" Examples of useful colon-separated values:
"longest:full"	Like "longest", but also start 'wildmenu' if it is
"         enabled.  Will not complete to the next full match.
"list:full"	When more than one match, list all matches and
"         complete first match.
"list:longest"	When more than one match, list all matches and
"         complete till longest common string.
"list:lastused" When more than one buffer matches, list all matches
"         and sort buffers by time last used (other than the
"         current buffer).
" 
" Examples: >
"     :set wildmode=full
" <	Complete first full match, next match, etc.  (the default) >
"     :set wildmode=longest,full
" <	Complete longest common string, then each full match >
"     :set wildmode=list:full
" <	List all matches and complete each full match >
"     :set wildmode=list,full
" <	List all matches without completing, then each full match >
"     :set wildmode=longest,list
" <	Complete longest common string, then list alternatives.
" More info here: |cmdline-completion|.
set wildmode=list:longest

" A list of file patterns.  A file that matches with one of these
" patterns is ignored when expanding |wildcards|, completing file or
" directory names, and influences the result of |expand()|, |glob()| and
" |globpath()| unless a flag is passed to disable this.
" The pattern is used like with |:autocmd|, see |autocmd-patterns|.
" Also see 'suffixes'.
" Example: >
"     :set wildignore=*.o,*.obj
" <	The use of |:set+=| and |:set-=| is preferred when adding or removing
" a pattern from the list.  This avoids problems when a future version
" uses another default.
set wildignore=*.doc,*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.xlsx

" When "on" the commands listed below move the cursor to the first
" non-blank of the line.  When off the cursor is kept in the same column
" (if possible).  This applies to the commands: CTRL-D, CTRL-U, CTRL-B,
" CTRL-F, "G", "H", "M", "L", gg, and to the commands "d", "<<" and ">>"
" with a linewise operator, with "%" with a count and to buffer changing
" commands (CTRL-^, :bnext, :bNext, etc.).  Also for an Ex command that
" only has a line number, e.g., ":25" or ":+".
" In case of buffer changing commands the cursor is placed at the column
" where it was the last time the buffer was edited.
" NOTE: This option is set when 'compatible' is set.
set nostartofline

" Hack to fix backspace behavior in vim
set backspace=indent,eol,start

" When off a buffer is unloaded when it is |abandon|ed.  When on a
" buffer becomes hidden when it is |abandon|ed.  If the buffer is still
" displayed in another window, it does not become hidden, of course.
" The commands that move through the buffer list sometimes make a buffer
" hidden although the 'hidden' option is off: When the buffer is
" modified, 'autowrite' is off or writing is not possible, and the '!'
" flag was used.  See also |windows.txt|.
" To only make one buffer hidden use the 'bufhidden' option.
" This option is set for one command with ":hide {command}" |:hide|.
" WARNING: It's easy to forget that you have changes in hidden buffers.
" Think twice when using ":q!" or ":qa!".
set hidden

" Indicates a fast terminal connection.  More characters will be sent to
" the screen for redrawing, instead of using insert/delete line
" commands.  Improves smoothness of redrawing when there are multiple
" windows and the terminal does not support a scrolling region.
" Also enables the extra writing of characters at the end of each screen
" line for lines that wrap.  This helps when using copy/paste with the
" mouse in an xterm and other terminals.
set ttyfast

" Ignore case in search patterns.  Also used when searching in the tags file.
set noignorecase

" Override the 'ignorecase' option if the search pattern contains upper
" case characters.  Only used when the search pattern is typed and
" 'ignorecase' option is on.  Used for the commands "/", "?", "n", "N",
" ":g" and ":s".  Not used for "*", "#", "gd", tag search, etc.  After
" "*" and "#" you can make 'smartcase' used by doing a "/" command,
" recalling the search pattern from history and hitting <Enter>.
" NOTE: This option is reset when 'compatible' is set.
set smartcase

" Set number of colors tob be supported
set t_Co=256

" The value of this option influences when the last window will have a
" status line:
"    0: never
"    1: only if there are at least two windows
"    2: always
" The screen looks nicer with a status line if you have several
" windows, but it takes another screen line. |status-line|
set laststatus=2

" When there is a previous search pattern, highlight all its matches.
" The type of highlighting used can be set with the 'l' occasion in the
" 'highlight' option.  This uses the "Search" highlight group by
" default.  Note that only the matching text is highlighted, any offsets
" are not applied.
" See also: 'incsearch' and |:match|.
" When you get bored looking at the highlighted matches, you can turn it
" off with |:nohlsearch|.  This does not change the option value, as
" soon as you use a search command, the highlighting comes back.
" 'redrawtime' specifies the maximum time spent on finding matches.
" When the search pattern can match an end-of-line, Vim will try to
" highlight all of the matched text.  However, this depends on where the
" search starts.  This will be the first line in the window or the first
" line below a closed fold.  A match in a previous line which is not
" drawn may not continue in a newly drawn line.
" You can specify whether the highlight status is restored on startup
" with the 'h' flag in 'viminfo' |viminfo-h|.
set hlsearch

" While typing a search command, show where the pattern, as it was typed
" so far, matches.  The matched string is highlighted.  If the pattern
" is invalid or not found, nothing is shown.  The screen will be updated
" often, this is only useful on fast terminals.
" Also applies to the pattern in commands: >
"     :global
"     :lvimgrep
"     :lvimgrepadd
"     :smagic
"     :snomagic
"     :sort
"     :substitute
"     :vglobal
"     :vimgrep
"     :vimgrepadd
" <	Note that the match will be shown, but the cursor will return to its
" original position when no match is found and when pressing <Esc>.  You
" still need to finish the search command with <Enter> to move the
" cursor to the match.
" You can use the CTRL-G and CTRL-T keys to move to the next and
" previous match. |c_CTRL-G| |c_CTRL-T|
" When compiled with the |+reltime| feature Vim only searches for about
" half a second.  With a complicated pattern and/or a lot of text the
" match may not be found.  This is to avoid that Vim hangs while you
" are typing the pattern.
" The highlighting can be set with the 'i' flag in 'highlight'.
" When 'hlsearch' is on, all matched strings are highlighted too while
" typing a search command. See also: 'hlsearch'.
" If you don't want to turn 'hlsearch' on, but want to highlight all
" matches while searching, you can turn on and off 'hlsearch' with
" autocmd.  Example: >
"     augroup vimrc-incsearch-highlight
"       autocmd!
"       autocmd CmdlineEnter /,\? :set hlsearch
"       autocmd CmdlineLeave /,\? :set nohlsearch
"     augroup END
" <
" CTRL-L can be used to add one character from after the current match
" to the command line.  If 'ignorecase' and 'smartcase' are set and the
" command line has no uppercase characters, the added character is
" converted to lowercase.
" CTRL-R CTRL-W can be used to add the word at the end of the current
" match, excluding the characters that were already typed.
" NOTE: This option is reset when 'compatible' is set.
set incsearch

" Make a backup before overwriting a file.  Leave it around after the
" file has been successfully written.  If you do not want to keep the
" backup file, but you do want a backup while the file is being
" written, reset this option and set the 'writebackup' option (this is
" the default).  If you do not want a backup file at all reset both
" options (use this if your file system is almost full).  See the
" |backup-table| for more explanations.
" When the 'backupskip' pattern matches, a backup is not made anyway.
" When 'patchmode' is set, the backup may be renamed to become the
" oldest version of a file.
" NOTE: This option is reset when 'compatible' is set.
set nobackup


" If 'modeline' is on 'modelines' gives the number of lines that is
" checked for set commands.  If 'modeline' is off or 'modelines' is zero
" no lines are checked.  See |modeline|.
" NOTE: 'modeline' is set to the Vi default value when 'compatible' is
" set and to the Vim default value when 'compatible' is reset.
set modelines=0


" Use a visual bell instead of beeping.  The terminal code to display the
" visual bell is given with 't_vb'.  When no beep or flash is wanted,
" use: >
"     :set vb t_vb=
" <	If you want a short flash, you can use this on many terminals: >
"     :set vb t_vb=[?5h$<100>[?5l
" <	Here $<100> specifies the time, you can use a smaller or bigger value
" to get a shorter or longer flash.
" 
" Note: Vim will limit the bell to once per half a second.  This avoids
" having to wait for the flashing to finish when there are lots of
" bells, e.g. on key repeat.  This also happens without 'visualbell'
" set.
" 
" In the GUI, 't_vb' defaults to "<Esc>|f", which inverts the display
" for 20 msec.  If you want to use a different time, use "<Esc>|40f",
" where 40 is the time in msec.
" 
" Note: When the GUI starts, 't_vb' is reset to its default value.  You
" might want to set it again in your |gvimrc|.
" 
" Does not work on the Amiga, you always get a screen flash.
" Also see 'errorbells'.
set novisualbell

" Set file encoding to UTF-8
set encoding=utf-8

" Minimal number of screen lines to keep above and below the cursor.
" This will make some context visible around where you are working.  If
" you set it to a very large value (999) the cursor line will always be
" in the middle of the window (except at the start or end of the file or
" when long lines wrap).
" After using the local value, go back the global value with one of
" these two: >
"     setlocal scrolloff<
"     setlocal scrolloff=-1
" <	For scrolling horizontally see 'sidescrolloff'.
set scrolloff=8

" Turn on syntax highlighting
syntax on

" Enable file type detection
filetype on

" Load an indent file for detected file type
filetype indent on

" Enable and load plugins for detected file type
filetype plugin on

map gf <C-W>gf

autocmd Filetype yaml set ts=2 sts=2 sw=2 expandtab
