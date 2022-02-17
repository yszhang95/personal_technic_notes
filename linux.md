- [LINUX](#orgad140c8)
  - [Text manipulation on LINUX](#org4faca78)
    - [The `sed`](#org984865d)
  - [tips about `fstab` and `mount`](#tips-for-fstab-and-mount)
  - [Locales](#org4556e10)
- [Windows subsystem (WSL)](#org80f28ba)
  - [Fedora](#orgc705f76)
    - [Installations](#org50aba19)
    - [Some configurations after installations](#org1d7eb02)
    - [Explore linux files using Widows explorer](#org980d3e4)
    - [Windows terminal shortcuts](#org62f4730)
    - [`X11` supports](#org62d436c)
    - [Change the default shell](#orga805f61)
    - [Terminals](#orgbfd3478)
    - [`man` utilities](#org2454e2f)
    - [Upgrade from Fedora 33 to 34](#org3a15b8f)
    - [File permission](#org86bde75)
    - [How to mount a virtual disk (VHD)](#org0b03f39)
    - [The default `WSL` VHD path](#org313587e)
    - [locale](#orgd1fe2ff)



<a id="orgad140c8"></a>

# LINUX


<a id="org4faca78"></a>

## Text manipulation on LINUX


<a id="org984865d"></a>

### The `sed`

1.  Print

    Try `/pattern/p`. Address can be used.
    
        sed -n "/^#/p" input_file # -n help you supress the output
    
    Suppose we have an example file the same as the one in [1.1.1.3](#org2233770). Run with command `sed -n '/1-/,/2-/p' example.txt`. and

2.  Replacement

    Try `s/pattern/replacement/option`. And you can preceed address (`man sed`) to `s`. Here, `option` can be `g`, similar to `vim`. `pattern` is written in format of regular expression. You can use `&` and `\1` to `\9` to denote the matched portion of `pattern` in `replacement`. For instance, if you want to replace `-` in the first part of `1-2-3-4 1E-10`. Let us do the following,
    
    ```shell
    cat > example.txt
    1-2-3-4 1E-10
    ^D
    sed -E 's/([^E])-/\1 /g' example.txt # -E or -r means extended-regular-expressions
    ```
    
    Suppose we have an example file the same as the one in [1.1.1.3](#org2233770). Run `sed -E '/^1/,/^2/s/^([0-9])-([0-9])-([0-9])-([0-9])/\1,\2,\3,\4/' example.txt`.

3.  Scripts

    <a id="org2233770"></a> A simple example of sequential replacement.Supposing that we have an example file `example.txt` having the following content,
    
        1-2-3-4 1E-10
        2-3-4-5 2E10
        3-4-5-6 3E-99
    
    write in the file `sed-example.bash` the following content:
    
        #!/usr/bin/bash
        # or /bin/bash, depending on the system
        # -i means in-place, do not use it if you are not sure you are doing
        # the correct things
        sed -iE '
        1,1s/([^E])-/\1 /g
        2,2s/([^E])-/\1~/g
        3,3s/([^E])-/\1./g
        ' $@
    
    And execute `chmod +x sed-example.bash` and `./sed-example.bash example.txt`. The output will look like
    
        1 2 3 4 1E-10
        2~3~4~5 2E10
        3.4.5.6 3E-99


<a id="tips-for-fstab-and-mount"></a>

## tips about `fstab` and `mount`

I referred to this [webpage](https://help.ubuntu.com/community/Fstab). Let us say you want to mount a partition, you may want to try

    sudo mount -t drvfs C: /mnt/c -o metadata

This tells the system that the mounted partition is in format of `drvfs` file system. The mount option is `metadata`, specified by `-o`. The source point is `C:`, the c drive on Windows. The target/destination is `/mnt/c`. It corresponds to the setup in `/etc/fstab/` like:

    C: /mnt/c drvfs metadata 0 0

The syntax for `/etc/fstab` is:

    [Device] [Mount Point] [File System Type] [Options] [Dump] [Pass]

Please check the [webpage](https://help.ubuntu.com/community/Fstab) for further reference.


<a id="org4556e10"></a>

## Locales

Here is a good [post](https://www.ibm.com/docs/en/aix/7.1?topic=locales-understanding-locale-environment-variables) from IBM for `locale`. It explains the meaning of each variable. You could also refer to `Ubuntu` [wiki](https://help.ubuntu.com/community/EnvironmentVariables#Locale_setting_variables). And you can find [discussions](https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html) from `GNU`. I copied the descriptions from [wiki](https://wiki.archlinux.org/title/locale) of `ArchLinux`.

> Locales are used by `glibc` and other locale-aware programs or libraries for rendering text, correctly displaying regional monetary values, time and date formats, alphabetic idiosyncrasies, and other locale-specific standards.

You could use `locale-gen` to generate locale files. You also need the file `/etc/locale.gen`. Google more and you will know more. It is recommended to use `UTF-8` character set according to `ArchLinux` [wiki](https://wiki.archlinux.org/title/locale).

You can use

    locale -a

to list all locales available on the system.

You may also want to check this [post](https://superuser.com/questions/999133/differences-between-en-us-utf8-and-en-us-utf-8). It may be better to use

    export LANG=en_US.UTF-8

instead of `en_US.utf8`.


<a id="org80f28ba"></a>

# Windows subsystem (WSL)


<a id="orgc705f76"></a>

## Fedora


<a id="org50aba19"></a>

### Installations

Please consult this [post](https://www.reddit.com/r/Fedora/comments/ii3tor/install_fedora_32_or_33_on_windows_10_wsl_2/) and this [link](https://dev.to/bowmanjd/install-fedora-on-windows-subsystem-for-linux-wsl-4b26).


<a id="org1d7eb02"></a>

### Some configurations after installations

Create or edit the file `/etc/wsl.conf`. Append to `wsl.conf` the following content:

    [automount]
    enabled = true
    options = "metadata,umask=22,fmask=111"
    
    [interop]
    appendWindowsPath = false

After setting up `fmask=111`. I found I could not create any symbolic link with correct permission. I finally change it to `fmask=11`.

    [automount]
    enabled = true
    options = "metadata,umask=22,fmask=11"
    
    [interop]
    appendWindowsPath = false


<a id="org980d3e4"></a>

### Explore linux files using Widows explorer

Comment out the lines inside `/etc/wsl.conf`,

    #[interop]
    #appendWindowsPath = false

And then run `explorer.exe .`. See this [post](https://stackoverflow.com/questions/44245721/launching-explorer-from-wsl).

Or use `PowerShell` to check `WSL` directory outside `Linux`. Then you do not have to edit `/etc/wsl.conf`. See this [post](https://github.com/microsoft/WSL/issues/4027#issuecomment-494969089). Run `dir //wsl$/<your-distro>`. To get `<your-distro>`, run `wsl -l` inside `PowerShell`.


<a id="org62f4730"></a>

### Windows terminal shortcuts

If you want to disable some keybindings, like "toggleFullscreen", use the following,

    { "command": null, "keys": "alt+enter" },
    { "command": null, "keys": "f11" },

More actions please see [this link](https://docs.microsoft.com/en-us/windows/terminal/customize-settings/actions) and [this post](https://superuser.com/questions/1558490/how-can-i-remove-a-default-key-binding-in-windows-terminal).

For the time being, the shortcut `C-c C-,` in `org-mode` does not work. I may give up `Windows Terminal`.


<a id="org62d436c"></a>

### `X11` supports

<a id="org2e60153"></a> I followed this [link](https://stackoverflow.com/questions/61110603/how-to-set-up-working-x11-forwarding-on-wsl2). Append this two lines into `.bashrc` or other similar files.

    export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
    export LIBGL_ALWAYS_INDIRECT=1

The suggested `X11` application is [VcXSrv](https://sourceforge.net/projects/vcxsrv/). You need to toggle the option `Disable access control` when you open it.


<a id="orga805f61"></a>

### Change the default shell

I did not find `chsh` which is supposed to switch shell in some other releases of `Linux`. Instead I chose to directly edit `/etc/passwd`.

I want to try `oh-my-zsh`. I installed `zsh` via `sudo dnf install zsh`. And I followed the [link](https://ohmyz.sh/#install) to download `oh-my-zsh`. I have not mastered it yet. You can read its [wiki](https://github.com/ohmyzsh/ohmyzsh/wiki).


<a id="orgbfd3478"></a>

### Terminals

I can run `gnome-terminal` after running

    sudo dnf install gnome-terminal dbus dbus-x11

After setting up the environment variable following [2.1.5](#org2e60153) (or try another way), `gnome-terminal` can work.

If you do not write those two lines (see [2.1.5](#org2e60153)) into `.bashrc`. You may face errors like

    libGL error: No matching fbConfigs or visuals found
    libGL error: failed to load driver: swrast

To fix it, you may try `sudo dnf install mesa-dri-drivers`. If it does not work, you can try

    DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0 LIBGL_ALWAYS_INDIRECT=1 dbus-launch gnome-terminal

I have not found a way successfully starting terminal from windows shortcuts.

I successfully run `konsole` from a windows shortcut. Run `sudo dnf install konsole dbus dbus-x11`. And then in windows platform, create two files. I consulted two links, [link-1](https://itnext.io/using-windows-10-as-a-desktop-environment-for-linux-7b2d8239f2f1) and [link-2](https://baroni.tech/posts/best-wsl-terminal/). I post scripts here. Script-1 will be used in script-2.

The content of script-1 (I named it `wsl-runner-app.bat`):

    @echo off
    for /f "tokens=3 delims=: " %%I in ('netsh interface IPv4 show addresses "vEthernet (WSL)" ^| findstr /C:"IP Address"') do set ip==%%I
    set ipAddress=%ip:~1%
    Powershell.exe wsl "DISPLAY='%ipAddress%':0" %1

Script-2 looks like (I named it `runkonsole.vbs`):

    Function CheckCommandIsRunning(ProcessName)
    	sComputerName = "."
    	Set objWMIService = GetObject("winmgmts:\\" & sComputerName & "\root\cimv2")
    	sQuery = "SELECT * FROM Win32_Process WHERE CommandLine LIKE '%" + ProcessName + "%'"
    	Set objItems = objWMIService.ExecQuery(sQuery)
    	If objItems.Count > 0 Then
    		CheckCommandIsRunning = True
    	Else
    		CheckCommandIsRunning = False
    	End If
    	Set objWMIService = Nothing
    	Set objItems = Nothing
    End Function
    
    Function SilentlyStartCommand(Command)
    	Set WshShell = CreateObject("WScript.Shell" )
    	WshShell.Run Command, 0 
    	Set WshShell = Nothing 
    End Function
    
    If Not CheckCommandIsRunning("vcxsrv.exe") Then
    	SilentlyStartCommand """C:\Program Files\VcXsrv\vcxsrv.exe"" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl"
    	WScript.Sleep 1000
    End If
    
    Set oShell = CreateObject ("Wscript.Shell") 
    Dim strArgs
    strArgs = "cmd /c wsl-runner-app.bat konsole"
    oShell.Run strArgs, 0, false

It will run `VcXsrv` automatically. But note, if you have already run `VcXsrv`, this script will crash. Make sure you do not do that.

The keybindings of `gnome-terminal`, `konsole` and other terminals does not work properly. I cannot type in `C-,`. Instead I will have `,` if I typ `C-,`.

Finally, I switch to `xterm`. It can work properly. I consulted several links: [Reddit-link-for-xterm-configuration](https://www.reddit.com/r/bashonubuntuonwindows/comments/izo943/setting_default_font_type_and_size_with_vcxsrv/), [xterm-descriptions-on-ArchLinuxWiki](https://wiki.archlinux.org/index.php/Xterm), [X-resources-descriptions-on-ArchLinuxWiki](https://wiki.archlinux.org/index.php/X_resources), [a-portable-configuration-on-github](https://github.com/Filius-Patris/dotfiles/blob/master/xterm/xdefaults) and [Emacs-Meta-Key-Wiki](https://www.emacswiki.org/emacs/MetaKeyProblems). I post my configurations in `~/.Xresources`. To make it take effects, run `xrdb ~/.Xresources` or `xrdb -merge ~/.Xresources`. Option `merge` will keep the old and append the new (that is why it is called "merge"). The contents of `.Xresources` are:

    Xterm*locale: false
    Xterm*utf8: 1
    XTerm*renderFont: true
    
    !XTerm*reverseVideo:    on
    xterm*VT100.Translations: #override \
                     Ctrl Shift <Key>V:    insert-selection(CLIPBOARD) \n\
                     Ctrl Shift <Key>C:    copy-selection(CLIPBOARD)
    
    ! Fonts ====================================================
    ! set font and fontsize
    ! XTerm*faceName: DejaVu Sans Mono
    XTerm*faceName: Terminus
    XTerm*faceSize: 16
    
    ! VT Font Menu: Unreadable
    xterm*faceSize1: 6
    ! VT font menu: Tiny
    xterm*faceSize2: 8
    ! VT font menu: Medium
    xterm*faceSize3: 10
    ! VT font menu: Large
    xterm*faceSize4: 14
    ! VT font menu: Huge
    xterm*faceSize5: 20
    
    XTerm*termName: xterm-256color
    XTerm*metaSendsEscape: true
    XTerm*eightBitInput: false
    
    XTerm*saveLines: 4096
    XTerm*scrollBar: true
    XTerm*scrollbar.width: 8

To start `xterm` from `$HOME`, I created a small program using `c++`. I create a file called `run_xterm.cpp` and compile it with `g++ run_xterm.cpp -o run-xterm`. And put it under `/usr/bin`. Then you can replace the line `strArgs = "cmd /c wsl-runner-app.bat konsole"` with `strArgs = "cmd /c wsl-runner-app.bat run-xterm"`. The file content of `run_xterm.cpp` are shown below:

```c++
#include <cstdlib>
#include <iostream>

int main()
{
    std::system("cd;xterm /bin/zsh");
}
```

I cannot figure out why the first character in `zsh` would display in wrong way. You may consult the [link](https://unix.stackexchange.com/questions/90772/first-characters-of-the-command-repeated-in-the-display-when-completing) to solve it. After installing `en_US.UTF-8`, I have everything normal. I am not sure whether this is the reason. To install the corresponding `locale`, run `sudo dnf install glibc-langpack-en`.

I append this [theme](https://github.com/chriskempson/tomorrow-theme/blob/master/Xdefaults/Tomorrow) to the `.Xresources`.


<a id="org2454e2f"></a>

### `man` utilities

See this [link](https://ask.fedoraproject.org/t/wsl-2-and-man-pages/11337). I quote his words here:

> Comment out or remove `tsflags=nodocs` from: `/etc/dnf/dnf.conf` Remove and reinstall `man & man-db` and `$ man man` now works as expected. Because the `rootfs` system is being borrowed from a container project, docs are turned off by default to save space. If you have any packages already install and you require the man pages, it will need to be reinstalled; so the man pages can be grabbed at install time.


<a id="org3a15b8f"></a>

### Upgrade from Fedora 33 to 34

Please consult this [link](https://dev.to/bowmanjd/how-to-upgrade-fedora-in-place-on-windows-subsystem-for-linux-wsl-oh3).


<a id="org86bde75"></a>

### File permission

Please consult this [issue](https://github.com/Microsoft/WSL/issues/936). I tried the [combination](https://github.com/Microsoft/WSL/issues/936#issuecomment-582904995) on this page.

It tells `WSL` not to automount the windows file system in a global way but to mount each folder in specific ways via

    [automount]
    enabled = false
    mountFsTab = true

After this, you need to add the following to `/etc/fstab` (some discussions in [tips about `fstab` and `mount`](#tips-for-fstab-and-mount)):

    c: /C drvfs rw,noatime,uid=10

00,gid=1000,umask=027,fmask=117,metadata 0 0

    //localhost/c$ /c drvfs ro,noatime,uid=1000,gid=1000,umask=027,fmask=007 0 0
    /C/Users /c/Users none bind 0 0

The original post may use `\t` but I am not sure. I have to replace multiple whitespaces in his proposed solution by single whiespace.

-   The first line ask `WSL` to mount `C:` at `/C`, in read-and-write mode. Files are considered as `640` permissions (see the masks). You need to create `/C` at first.
-   The second line ask the system to mount `//localhost/c$` at `/c`, in read-only mode. The file mode is `750`. The `//localhost/c$` is in syntax of network names (I am not sure if this is only for Windows).
-   Please notice the difference between the character cases.
-   The third line ask the system bind (not re-mount) the `C:\Users` directory from `/C` to `/c`.
-   Please refer to the [mount manual](https://man7.org/linux/man-pages/man8/mount.8.html), the [post](https://serverfault.com/questions/613179/how-do-i-do-mount-bind-in-etc-fstab), the [question](https://askubuntu.com/questions/1119456/how-to-create-a-persistent-mounting-point-in-ubuntu-app-on-windows-10), and windows [doc](https://docs.microsoft.com/en-us/windows/wsl/file-permissions#wsl-metadata-on-windows-files).
-   Now we have `/C` and `/c/Users/` in `640` mode and directories under `/c` except `/c/Users` in `750`.

A final block is

    export PATH="${PATH//\/C\//\/c\/}"

-   This is to replace capital `C` in `PATH` with `c` instead. This make the windows executable outside `/c/Users/` are callable in `WSL`. Recall that they are in mode `750`.

The fianl effect is:

-   The files orinally created by Windows, will be seen in `640` or `750`, as described above.
-   Your newly created files via `WSL` will be seen as `644` if you use `ls -l` in `WSL`,since the default `umask` value is `0022`. (Try yourself. It may differ case by case). However, if you check the file on `cygwin`, you will find the extra `executable` bit is on. The file is in mode `755`.
-   This is pretty urgly. But we do not have solutoins.
-   Remeber to transfer your file via `git`, `scp` inside `WSL`. This will prevent the file permission to be overriden before they are sent to other devices.


<a id="org0b03f39"></a>

### How to mount a virtual disk (VHD)

Please refer to this [link](https://docs.microsoft.com/en-us/windows/wsl/wsl2-mount-disk). It discusses the ways to mount disks, including physical and virtual disks. I only discuss the virtual disk here.

You need to execute the following in `powershell` using administrator mode

    wsl --shutdown
    Write-Output "\\.\PhysicalDrive$((Mount-VHD -Path <pathToVHD> -PassThru | Get-Disk).Number)"

Remeber to replace `<pathToVHD>` with the path to VHD file. The second line will give you something like:

    \\.\PhysicalDrive1

The number 1 at the end may differ case by case. Then, we need to start `WSL` using

    wsl --mount \\.\PhysicalDrive1

You will find that the virtual disk is mounted at `/mnt/wsl/PhysicalDrive1`. To unmount the drive, do

    wsl --unmount <DiskPath>

Please explore more options in the [link](https://docs.microsoft.com/en-us/windows/wsl/wsl2-mount-disk), for example, how to mount a specific point, how to specify disk type&#x2026;


<a id="org313587e"></a>

### The default `WSL` VHD path

Please find the below:

    C:\Users\[user]\AppData\Local\Packages\[distro]\LocalState\[distroPackageName]

I refer to this [link](https://docs.microsoft.com/en-us/windows/wsl/wsl2-mount-disk#mount-a-vhd-in-wsl).


<a id="orgd1fe2ff"></a>

### locale

I did not find `locale-gen` via `dnf`. I tried to do the below:

    dnf install glibc-langpack-en
    export LNAG=en_US.UTF-8 # or en_US.utf8
