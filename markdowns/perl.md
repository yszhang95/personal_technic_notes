- [One-line phraser](#org7da11ac)
  - [`grep` and `sed` print](#org8ab7d5c)
  - [`sed` replacement](#org55e086f)
- [General scripts](#org5a02a52)
  - [String substitution](#org76807b4)
  - [Redirect output from system commands in perl](#org04f44c7)
  - [Run system comands](#orgad630e3)
  - [Return a value in subroutine](#orged84a70)
  - [How to call subroutine in command line](#orgdea182f)
  - [How to check if a file is plain file](#org787a017)
  - [Push, pop, shift, unshift arrays](#org08289c7)
  - [Break loop](#orgedd661a)
  - [Pass arguments to subroutine](#org50c9f36)
  - [system](#orgd0a9610)
  - [Replace string](#orgf452755)
  - [Ignore case sensitivity](#org5ac07e4)
  - [Boolean in perl](#org4caca55)
  - [Sort an array](#orge5f676e)
  - [Open a file](#org8bcb756)
  - [Read files](#orgad71850)
  - [Read multi-line](#org9e631ae)
  - [undef](#org1b4842e)
  - [Replace characters in multiple lines](#orgacb3210)
  - [Check if a variable is defined](#org521276e)
  - [Read a directory](#orgbe58697)
  - [how to select lines without containing a pattern](#orgf32b907)



<a id="org7da11ac"></a>

# One-line phraser


<a id="org8ab7d5c"></a>

## `grep` and `sed` print

Try `perl -ne 'print if /pattern/' input.txt`. For find in a range and print, try `perl -ne 'print if (m/PatternA/..m/PatternB/)'`.


<a id="org55e086f"></a>

## `sed` replacement

To replace the original string with the new in a specific range, try `perl -ne 's/this/that/g if (m/PatternA/..m/PatternB/)'`. I never try other cases without specificing a range.


<a id="org5a02a52"></a>

# General scripts


<a id="org76807b4"></a>

## String substitution     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-16 Tue 14:29]</span></span>

Please use

    my $newstring = $oldstring =~ s/foo/bar/r;

`/r` option is necessary to keep the original one. See [answer](https://stackoverflow.com/questions/3440363/perl-use-s-replace-and-return-new-string) and [answer](https://stackoverflow.com/questions/22836/how-do-i-perform-a-perl-substitution-on-a-string-while-keeping-the-original).


<a id="org04f44c7"></a>

## Redirect output from system commands in perl     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-16 Tue 14:35]</span></span>

Plain `>` only catch `STDOUT`. Redirect `STDERR` to `STDOUT` needs `2>&1`. An example

    system("ls -lst > example.txt 2>&1");

This is a dangerous way. Safer ways are discussed in [answer](https://stackoverflow.com/questions/7799045/best-way-to-capture-output-from-system-command-to-a-text-file) More info in [answer](https://stackoverflow.com/questions/818255/in-the-shell-what-does-21-mean),


<a id="orgad630e3"></a>

## Run system comands     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-16 Tue 15:49]</span></span>

Make use of `system` command. See the [link](https://perldoc.perl.org/functions/system).


<a id="orged84a70"></a>

## Return a value in subroutine     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-16 Tue 15:55]</span></span>

Make use of `return` at the end of the subroutine. See the [link](https://www.perltutorial.org/perl-subroutine/) and [link](https://www.learn-perl.org/en/Subroutines).


<a id="orgdea182f"></a>

## How to call subroutine in command line     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-17 Wed 09:51]</span></span>

I checked this [link](https://stackoverflow.com/questions/23039028/calling-perl-subroutines-from-the-command-line). I choose the way using hash. You may want to check others.

I quote the method here. The script is

```perl
#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

sub fields {
  say 'this is fields';
}

sub another {
  say 'this is another subroutine';
}

my %functions = (
  fields  => \&fields,
  another => \&another,
);

my $function = shift;

if (exists n$functions{$function}) {
  $functions{$function}->();
} else {
  die "There is no function called $function available\n";
}
```

The usage is

    $ ./dispatch_tab fields
    this is fields
    $ ./dispatch_tab another
    this is another subroutine
    $ ./dispatch_tab xxx
    There is no function called xxx available


<a id="org787a017"></a>

## How to check if a file is plain file     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-17 Wed 23:33]</span></span>

`-f` function is useful to check if a file is a plain file. See the [answer](https://stackoverflow.com/questions/206320/how-do-i-distinguish-a-file-from-a-directory-in-perl) and [link](https://perldoc.perl.org/perlfunc#-X-FILEHANDLE). A usage can be checked in the doc for [readdir](https://perldoc.perl.org/functions/readdir).

```perl
opendir(my $dh, $some_dir) || die "Can't opendir $some_dir: $!";
my @dots = grep { /^\./ && -f "$some_dir/$_" } readdir($dh);
closedir $dh;
```


<a id="org08289c7"></a>

## Push, pop, shift, unshift arrays     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 00:23]</span></span>

See the [link](https://www.learn-perl.org/en/Arrays).

-   `push(@array, element)`, add element or elements into the end of the array
-   `$popped = pop(@array)`, delete and return the last element of the array
-   `$shifted = shift(@array)`, delete and return the first element of the array
-   `unshift(@array)`, add element or elements into the beginning of the array


<a id="orgedd661a"></a>

## Break loop     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 01:09]</span></span>

You could use `last` statement to break the innermost loop. Other usage can be found in the [link](https://perldoc.perl.org/functions/last). And here is a related [question](https://stackoverflow.com/questions/303216/how-do-i-break-out-of-a-loop-in-perl) on `Stackoverflow`.


<a id="org50c9f36"></a>

## Pass arguments to subroutine     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 01:21]</span></span>

See this [link](https://www.perltutorial.org/passing-parameters-to-subroutine/). The first argument is `$_[0]` and the second is `$_[1]`. The array need to be passed as reference. See this [question and answer](https://stackoverflow.com/questions/10729015/pass-array-and-scalar-to-a-perl-subroutine).


<a id="orgd0a9610"></a>

## system     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 16:19]</span></span>

Please check the [link](https://perldoc.perl.org/functions/system).


<a id="orgf452755"></a>

## Replace string     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 16:27]</span></span>

We need the operator [s](https://perldoc.pl/perlfunc#s///). An example:

```perl
my $myvar = "abc";
print ("$myvar\n");
$myvar =~ s/a/A/; # this will modify the original string
print( $myvar =~ s/b/B/ ); # $myvar won't be printed.
print( $myvar =~ s/c/C/r ); # r option guarantee original one unchanged
$mynewvar = $myvar =~ s/c/C/r; # a new string saved in $mynewvar
```

Please note the difference between the return value with and without option `r`. Also see this [answer](https://stackoverflow.com/questions/3440363/perl-use-s-replace-and-return-new-string).


<a id="org5ac07e4"></a>

## Ignore case sensitivity     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 16:52]</span></span>

You can use `i` mdifier, an example `/G[a-b].*/i`. Check this [answer](https://stackoverflow.com/questions/9655164/regex-ignore-case-sensitivity).


<a id="org4caca55"></a>

## Boolean in perl     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 16:54]</span></span>

I quote the [answer](https://stackoverflow.com/questions/1036347/how-do-i-use-boolean-variables-in-perl) here. The following are false and others are true.

    0
    '0'
    undef
    ''  # Empty scalar
    ()  # Empty list
    ('')


<a id="orge5f676e"></a>

## Sort an array     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 17:08]</span></span>

Make use of [sort](https://perldoc.perl.org/functions/sort).


<a id="org8bcb756"></a>

## Open a file     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 17:09]</span></span>

Make use of [open](https://perldoc.perl.org/functions/open). It needs file handle, mode, and filename.

    open(filehandle,mode,filename)

You have three modes:

| mode   | operand |
|------ |------- |
| read   | `<`     |
| write  | `>`     |
| append | `>>`    |

Also check this [link](https://www.perltutorial.org/perl-open-file/).


<a id="orgad71850"></a>

## Read files     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 17:12]</span></span>

Check this [link](https://www.perltutorial.org/perl-read-file/).


<a id="org9e631ae"></a>

## Read multi-line     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 21:03]</span></span>

You need to redefine the variable `$/` to `undef`, which is dangerous. Then `<>` will read the file in one chunk. See the [discussions](https://stackoverflow.com/questions/1030787/multiline-search-replace-with-perl).


<a id="org1b4842e"></a>

## undef     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 21:06]</span></span>

See this [link](https://perldoc.perl.org/functions/undef).


<a id="orgacb3210"></a>

## Replace characters in multiple lines     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 21:07]</span></span>

Use the modifier `/s`. Check this [link](https://stackoverflow.com/questions/6764350/extract-text-from-a-multiline-string-using-perl).


<a id="org521276e"></a>

## Check if a variable is defined     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 21:08]</span></span>

You can make use of [defined](https://perldoc.perl.org/functions/defined).


<a id="orgbe58697"></a>

## Read a directory     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 21:11]</span></span>

Make use of `opendir` and `readdir`. See this [link](https://perldoc.perl.org/functions/readdir).


<a id="orgf32b907"></a>

## how to select lines without containing a pattern     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-25 Thu 16:45]</span></span>

Please check this [answer](https://stackoverflow.com/questions/406230/regular-expression-to-match-a-line-that-doesnt-contain-a-word), using `(?!)`.
