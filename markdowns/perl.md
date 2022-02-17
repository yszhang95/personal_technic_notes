
# Table of Contents

1.  [One-line phraser](#org8634cc1)
    1.  [`grep` and `sed` print](#org63c43be)
    2.  [`sed` replacement](#org63a5c58)
    3.  [String substitution](#org8cded3f):NOTE:
    4.  [Redirect output from system commands in perl](#org8066757):NOTE:
    5.  [Run system comands](#org1384014):NOTE:
    6.  [Return a value in subroutine](#org4e3c8bb):NOTE:
    7.  [How to call subroutine in command line](#org1ff013f):NOTE:
    8.  [How to check if a file is plain file](#org445ac4f):NOTE:
    9.  [Push, pop, shift, unshift arrays](#org3fd0d12):NOTE:
    10. [Break loop](#orgbd53972):NOTE:
    11. [Pass arguments to subroutine](#orgbca7139):NOTE:
    12. [system](#orgdbd84e7):NOTE:
    13. [Replace string](#orgec0b5d4):NOTE:
    14. [Ignore case sensitivity](#org726754e):NOTE:
    15. [Boolean in perl](#orgfc01ee5):NOTE:
    16. [Sort an array](#org2a96e92):NOTE:
    17. [Open a file](#orgd5f1574):NOTE:
    18. [Read files](#orgcc5ca55):NOTE:
    19. [Read multi-line](#org6cf05fe):NOTE:
    20. [undef](#org4da38f7):NOTE:
    21. [Replace characters in multiple lines](#org43d9c26):NOTE:
    22. [Check if a variable is defined](#orgfa0ed95):NOTE:
    23. [Read a directory](#org3d07d43):NOTE:
    24. [how to select lines without containing a pattern](#orgdedc371):NOTE:



<a id="org8634cc1"></a>

# One-line phraser


<a id="org63c43be"></a>

## `grep` and `sed` print

Try `perl -ne 'print if /pattern/' input.txt`. For find in
a range and print, try
`perl -ne 'print if (m/PatternA/..m/PatternB/)'`.


<a id="org63a5c58"></a>

## `sed` replacement

To replace the original string with the new in a specific range,
try `perl -ne 's/this/that/g if (m/PatternA/..m/PatternB/)'`.
I never try other cases without specificing a range.


<a id="org8cded3f"></a>

## String substitution     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-16 Tue 14:29]</span></span>

Please use

    my $newstring = $oldstring =~ s/foo/bar/r;

`/r` option is necessary to keep the original one. See [answer](https://stackoverflow.com/questions/3440363/perl-use-s-replace-and-return-new-string) and
[answer](https://stackoverflow.com/questions/22836/how-do-i-perform-a-perl-substitution-on-a-string-while-keeping-the-original).


<a id="org8066757"></a>

## Redirect output from system commands in perl     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-16 Tue 14:35]</span></span>

Plain `>` only catch `STDOUT`. Redirect `STDERR` to `STDOUT` needs `2>&1`.
An example

    system("ls -lst > example.txt 2>&1");

This is a dangerous way. Safer ways are discussed in [answer](https://stackoverflow.com/questions/7799045/best-way-to-capture-output-from-system-command-to-a-text-file)
More info in [answer](https://stackoverflow.com/questions/818255/in-the-shell-what-does-21-mean),


<a id="org1384014"></a>

## Run system comands     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-16 Tue 15:49]</span></span>

Make use of `system` command. See the [link](https://perldoc.perl.org/functions/system).


<a id="org4e3c8bb"></a>

## Return a value in subroutine     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-16 Tue 15:55]</span></span>

Make use of `return` at the end of the subroutine. See the [link](https://www.perltutorial.org/perl-subroutine/) and
[link](https://www.learn-perl.org/en/Subroutines).


<a id="org1ff013f"></a>

## How to call subroutine in command line     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-17 Wed 09:51]</span></span>

I checked this [link](https://stackoverflow.com/questions/23039028/calling-perl-subroutines-from-the-command-line). I choose the way using hash. You may want to
check others.

I quote the method here. The script is

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

The usage is

    $ ./dispatch_tab fields
    this is fields
    $ ./dispatch_tab another
    this is another subroutine
    $ ./dispatch_tab xxx
    There is no function called xxx available


<a id="org445ac4f"></a>

## How to check if a file is plain file     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-17 Wed 23:33]</span></span>

`-f` function is useful to check if a file is a plain file. See the
[answer](https://stackoverflow.com/questions/206320/how-do-i-distinguish-a-file-from-a-directory-in-perl) and [link](https://perldoc.perl.org/perlfunc#-X-FILEHANDLE). A usage can be checked in the doc for [readdir](https://perldoc.perl.org/functions/readdir).

    opendir(my $dh, $some_dir) || die "Can't opendir $some_dir: $!";
    my @dots = grep { /^\./ && -f "$some_dir/$_" } readdir($dh);
    closedir $dh;


<a id="org3fd0d12"></a>

## Push, pop, shift, unshift arrays     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 00:23]</span></span>

See the [link](https://www.learn-perl.org/en/Arrays).

-   `push(@array, element)`, add element or elements into the end of the
    array
-   `$popped = pop(@array)`, delete and return the last element of the
    array
-   `$shifted = shift(@array)`, delete and return the first element of the
    array
-   `unshift(@array)`, add element or elements into the beginning of the
    array


<a id="orgbd53972"></a>

## Break loop     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 01:09]</span></span>

You could use `last` statement to break the innermost loop. Other usage
can be found in the [link](https://perldoc.perl.org/functions/last). And here is a related [question](https://stackoverflow.com/questions/303216/how-do-i-break-out-of-a-loop-in-perl) on
`Stackoverflow`.


<a id="orgbca7139"></a>

## Pass arguments to subroutine     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 01:21]</span></span>

See this [link](https://www.perltutorial.org/passing-parameters-to-subroutine/). The first argument is `$_[0]` and the second is
`$_[1]`. The array need to be passed as reference. See this [question
and answer](https://stackoverflow.com/questions/10729015/pass-array-and-scalar-to-a-perl-subroutine).


<a id="orgdbd84e7"></a>

## system     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 16:19]</span></span>

Please check the [link](https://perldoc.perl.org/functions/system).


<a id="orgec0b5d4"></a>

## Replace string     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 16:27]</span></span>

We need the operator [s](https://perldoc.pl/perlfunc#s///).
An example:

    my $myvar = "abc";
    print ("$myvar\n");
    $myvar =~ s/a/A/; # this will modify the original string
    print( $myvar =~ s/b/B/ ); # $myvar won't be printed.
    print( $myvar =~ s/c/C/r ); # r option guarantee original one unchanged
    $mynewvar = $myvar =~ s/c/C/r; # a new string saved in $mynewvar

Please note the difference between the return value with and without
option `r`. Also see this [answer](https://stackoverflow.com/questions/3440363/perl-use-s-replace-and-return-new-string).


<a id="org726754e"></a>

## Ignore case sensitivity     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 16:52]</span></span>

You can use `i` mdifier, an example `/G[a-b].*/i`. Check this [answer](https://stackoverflow.com/questions/9655164/regex-ignore-case-sensitivity).


<a id="orgfc01ee5"></a>

## Boolean in perl     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 16:54]</span></span>

I quote the [answer](https://stackoverflow.com/questions/1036347/how-do-i-use-boolean-variables-in-perl) here.
The following are false and others are true.

    0
    '0'
    undef
    ''  # Empty scalar
    ()  # Empty list
    ('')


<a id="org2a96e92"></a>

## Sort an array     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 17:08]</span></span>

Make use of [sort](https://perldoc.perl.org/functions/sort).


<a id="orgd5f1574"></a>

## Open a file     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 17:09]</span></span>

Make use of [open](https://perldoc.perl.org/functions/open). It needs file handle, mode, and filename.

    open(filehandle,mode,filename)

You have three modes:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">mode</th>
<th scope="col" class="org-left">operand</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">read</td>
<td class="org-left"><code>&lt;</code></td>
</tr>


<tr>
<td class="org-left">write</td>
<td class="org-left"><code>&gt;</code></td>
</tr>


<tr>
<td class="org-left">append</td>
<td class="org-left"><code>&gt;&gt;</code></td>
</tr>
</tbody>
</table>

Also check this [link](https://www.perltutorial.org/perl-open-file/).


<a id="orgcc5ca55"></a>

## Read files     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 17:12]</span></span>

Check this [link](https://www.perltutorial.org/perl-read-file/).


<a id="org6cf05fe"></a>

## Read multi-line     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 21:03]</span></span>

You need to redefine the variable `$/` to `undef`, which is dangerous.
Then `<>` will read the file in one chunk. See the [discussions](https://stackoverflow.com/questions/1030787/multiline-search-replace-with-perl).


<a id="org4da38f7"></a>

## undef     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 21:06]</span></span>

See this [link](https://perldoc.perl.org/functions/undef).


<a id="org43d9c26"></a>

## Replace characters in multiple lines     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 21:07]</span></span>

Use the modifier `/s`. Check this [link](https://stackoverflow.com/questions/6764350/extract-text-from-a-multiline-string-using-perl).


<a id="orgfa0ed95"></a>

## Check if a variable is defined     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 21:08]</span></span>

You can make use of [defined](https://perldoc.perl.org/functions/defined).


<a id="org3d07d43"></a>

## Read a directory     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-18 Thu 21:11]</span></span>

Make use of `opendir` and `readdir`. See this [link](https://perldoc.perl.org/functions/readdir).


<a id="orgdedc371"></a>

## how to select lines without containing a pattern     :NOTE:

<span class="timestamp-wrapper"><span class="timestamp">[2021-11-25 Thu 16:45]</span></span>

Please check this [answer](https://stackoverflow.com/questions/406230/regular-expression-to-match-a-line-that-doesnt-contain-a-word), using `(?!)`.

