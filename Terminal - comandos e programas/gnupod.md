# GNUPOD

Gerencie seu iPod com software livre!

`sudo apt install gnupod-tools`

Adicione uma música:

_(Tecla de atalho de Thunar)_

`gnupod_addsong.pl %F | Xdialog --title "GNUpod - Add song" --no-cancel --tailbox - 24 64`

Fonte:
https://www.gnu.org/software/gnupod/gnupod.html

---

## Manage your iPod

Adrian Ulrich

___

## Overview:

> [1\. GNUpod](https://www.gnu.org/software/gnupod/gnupod.html#SEC1)  
> [2\. Requirements](https://www.gnu.org/software/gnupod/gnupod.html#SEC2)  
> [3\. Installing GNUpod](https://www.gnu.org/software/gnupod/gnupod.html#SEC3)  
> [4\. Using GNUpod](https://www.gnu.org/software/gnupod/gnupod.html#SEC8)  
> [5\. Problems](https://www.gnu.org/software/gnupod/gnupod.html#SEC22)  
> [A. GNU Free Documentation License](https://www.gnu.org/software/gnupod/gnupod.html#SEC27)  

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC2"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 1\. GNUpod

This edition of the GNUpod Manual, last updated 20. Sep. 2007, documents GNUpod Version 0.99.4

> <table><tbody><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC2">2. Requirements</a></td><td>&nbsp;&nbsp;</td><td>What you will need to use GNUpod</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC3">3. Installing GNUpod</a></td><td>&nbsp;&nbsp;</td><td>How to install GNUpod and setup FireWire</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC8">4. Using GNUpod</a></td><td>&nbsp;&nbsp;</td><td>How to use the GNUpod-tools</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC22">5. Problems</a></td><td>&nbsp;&nbsp;</td><td>The FAQ</td></tr></tbody></table>
> 
>   
> Appendices  

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC1"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC3"> &gt; </a>]</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> &lt;&lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC3"> &gt;&gt; </a>]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 2\. Requirements

To use GNUpod, the follwing is needed:

-   iPod (HFS+ or FAT32)
-   Firewire card that is supported by the Operating System
-   Write support for HFS+ or FAT32
-   Perl 5.6 or 5.8
-   The Perl modules MP3::Info, File::Copy, Unicode::String, Digest::MD5 and XML::Parser
-   Basic knowledge of the shell

GNUpod is known to run on GNU/Linux, FreeBSD, Darwin (Mac OSX) and Solaris 9.

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC2"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC4"> &gt; </a>]</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC2"> &lt;&lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC8"> &gt;&gt; </a>]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 3\. Installing GNUpod

> <table><tbody><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC4">3.1 Installation of GNUpod</a></td><td>&nbsp;&nbsp;</td><td>How to install the Scripts</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC5">3.2 Using FireWire with GNU/Linux</a></td><td>&nbsp;&nbsp;</td><td>Setup FireWire on Linux</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC6">3.3 Convert your Mac iPod</a></td><td>&nbsp;&nbsp;</td><td>How to convert an HFS+ formatted iPod</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC7">3.4 Firmware update</a></td><td>&nbsp;&nbsp;</td><td>How to upgrade the Firmware using GNU/Linux</td></tr></tbody></table>

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC3"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC5"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 3.1 Installation of GNUpod

The installation of GNUpod is very simple:

<table><tbody><tr><td>&nbsp;</td><td><pre>tar -xzvf gnupod-tools-VERSION.tar.gz
cd gnupod-tools/
./configure
make install
</pre></td></tr></tbody></table>

The `configure` script checks if the desired Perl modules are installed.

On Debian GNU/Linux you'll simply have to run this commands to install the required Perl modules:

<table><tbody><tr><td>&nbsp;</td><td><pre>apt-get install libfile-ncopy-perl
apt-get install libmp3-info-perl
apt-get install libunicode-string-perl
apt-get install libxml-parser-perl
apt-get install libxml-simple-perl
</pre></td></tr></tbody></table>

If you are using a RPM-based Distribution (Mandrake, RedHat, SuSE..) try http://www.rpmfind.net.

Another way is to install the modules 'by hand'.

http://search.cpan.org

will help you to find the needed tarballs. If you don't know how to install them, please read

http://cpan.org/misc/cpan-faq.html#How\_install\_Perl\_modules

(Maybe you'd like to use the CPAN-Shell.. google knows how to use it ;-) )

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC4"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC6"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 3.2 Using FireWire with GNU/Linux

Of course the Linux kernel must support FireWire. If the one you are using doesn't have FireWire support you'll have to recompile your Kernel. (It's also a good idea to update the Kernel when you are doing this...)

If you don't know how to compile the Linux kernel, please read http://www.kernelnewbies.org/faq/index.php3#compile

To get FireWire working, you should configure the Kernel like this:

-   Code maturity level options - y
-   IEEE1394 (FireWire)/IEEE 1394 (FireWire) support (Experimental) - y
-   OHCI-1394 support - m
-   SBP-2 support - m

Feel free to build OHCI-1394 into the kernel ('y'), but make sure to compile SBP-2 support as module. It won't work (good) if you say 'y' there! If you don't own an OHCI-1394 FireWire card you may need to use the LYNX driver instead. But OHCI-1394 is the most common used, please also have a look at http://www.linux1394.org

After you rebootet with the new Kernel, you should now be able to mount the iPod. First load the OHCI-1394 module if you did say 'm' to OHCI-1394 support.

Now plugin the iPod and wait until you can see the 'hook-symbol' and load the sbp2 module using

Please keep in mind that FireWire support is still experimental and you may see Kernel Oopses and other nasty things. If your system hangs after loading sbp2 or mounting the iPod you may try to load sbp2 like this:

<table><tbody><tr><td>&nbsp;</td><td><pre>modprobe sbp2 sbp2_max_speed=0 sbp2_serialize_io=1 sbp2_force_inquiry_hack=1
</pre></td></tr></tbody></table>

This will slow down the transfer rate but should act much more stable. Note: Firewire works very good with Linux 2.6. If you have Problems with Linux 2.4, you may wan't to upgrade to 2.6 !

After loading sbp2, use `dmesg` to get some information, the output should look like this (If you are running linux 2.4.20 or older)

<table><tbody><tr><td>&nbsp;</td><td><pre>SBP-2 module load options:
- Max speed supported: S400
- Max sectors per I/O supported: 255
- Max outstanding commands supported: 8
- Max outstanding commands per lun supported: 1
- Serialized I/O (debug): no
- Exclusive login: yes
  Vendor: Apple     Model: iPod              Rev: 1.21
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi removable disk sdb at scsi1, channel 0, id 0, lun 0
SCSI device sdb: 9780750 512-byte hdwr sectors (5008 MB)
sda: test WP failed, assume Write Enabled
 sda: sda1 sda2
</pre></td></tr></tbody></table>

In this case, `/dev/sda` would be your iPod.

Linux 2.4.21 (and newer) doesn't show such verbose output and your iPod will not be detectet while loading sbp2. Simply run `rescan-scsi-bus.sh`. It should find your iPod (See /proc/scsi/scsi). (You can download 'rescan-scsi-bus.sh' at http://www.garloff.de/kurt/linux/rescan-scsi-bus.sh)

You can now mount the iPod:

<table><tbody><tr><td>&nbsp;</td><td><pre>mount -t vfat /dev/sda2 /mnt/ipod
</pre></td></tr></tbody></table>

It's a good idea to add a line like this to the fstab

<table><tbody><tr><td>&nbsp;</td><td><pre>/dev/sda2   /mnt/ipod   vfat   defaults,user,noauto,umask=000
</pre></td></tr></tbody></table>

Note: Avoid adding the 'sync' mount-option for flash based iPods (Shuffle, Nano) because flash drives have a limited number of write cycles.

Note2: As you can see, we assume an FAT32/VFAT formatted iPod (`-t vfat`), if you own a HFS+ formatted iPod (aka. Mac-iPod) please have a look at the next section 'Convert your Mac iPod' before using `mount`.

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC5"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC7"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 3.3 Convert your Mac iPod

If the Operating System you are running doesn't have write support for HFS+ and your iPod is HFS+ Formatted (aka 'Mac-iPod') you will have to reformat the iPod.

Note: Linux 2.6.4 includes HFS+ Read/WRITE Support(!) It's still experimental and may do nasty things. (But it works well for me..) If you build your kernel with HFS+ support, you don't have to convert your iPod :)

Please note that you will need a fdisk for DOS-Style partitions, you will also need a kernel that supports Mac- (to read the firmware) and Dos-style (to access the device after converting it) partitions. If you are using GNU/Linux on x86, your fdisk should be fine, but if you are running GNU/Linux on (for example) PowerPC you may have to get a suitable fdisk from the util-linux package which can be retrieved from: ftp://ftp.kernel.org/pub/linux/utils/util-linux/

Compile and install the pc-fdisk (and only the pc-fdisk!)

<table><tbody><tr><td>&nbsp;</td><td><pre>tar -xjvf util-linux-X.XXx.tar.bz2
cd util-linux-X.XXx
./configure
cd fdisk
make
cp fdisk /usr/sbin/pc-fdisk
</pre></td></tr></tbody></table>

We assume your iPod at `/dev/sda`. (No, don't mount the iPod, simply plugin the iPod and make sure it got detected with `dmesg`.

Here we go:

First, we 'backup' the current Firmware

<table><tbody><tr><td>&nbsp;</td><td><pre>dd if=/dev/sda2 of=backup_firmware
</pre></td></tr></tbody></table>

This should result in a ~32Mb big file, now we have to kill the old partition map and force the kernel to re-read the new (empty) map

<table><tbody><tr><td>&nbsp;</td><td><pre>dd if=/dev/zero of=/dev/sda bs=1M count=10
rmmod sbp2 &amp;&amp; insmod sbp2
</pre></td></tr></tbody></table>

Now we can use 'pc-fdisk' to create a new partition layout:

<table><tbody><tr><td>&nbsp;</td><td><pre>pc-fdisk /dev/sda [start fdisk]


Command (m for help): n [make new partition]
Command action
   e extended
   p primary partition (1-4)
p we want primary
Partition number (1-4): 1
First cylinder (1-608, default 1): [just press enter]
Using default value 1
Last cylinder or +size or +sizeM or +sizeK (1-608, default 608): +32M [32M is the default for 1.x iPods]

Command (m for help): n
Command action
   e extended
   p primary partition (1-4)
p
Partition number (1-4): 2
First cylinder (6-608, default 6): 6 [Just use the default value, press ENTER (don't worry if it isn't 6)]
Using default value 6
Last cylinder or +size or +sizeM or +sizeK (6-608, default 608): [press ENTER]
Using default value 608 [If you don't own a 5gb iPod, this value will be different, don't care about it]

Command (m for help): t [Modify type]
Partition number (1-4): 1
Hex code (type L to list codes): 0 [we don't care about the warning below]
Type 0 means free space to many systems
(but not to Linux). Having partitions of
type 0 is probably unwise. You can delete
a partition using the `d' command.
Changed system type of partition 1 to 0 (Empty)

Command (m for help): t
Partition number (1-4): 2 [this is where data will go]
Hex code (type L to list codes): b [b=FAT32]
Changed system type of partition 2 to b (Win95 FAT32)


Command (m for help): w [Writing new partition. Can take a while.]
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
</pre></td></tr></tbody></table>

Note: The first partition doesn't have to be 32M, it just needs enought space to hold the firmware image (6M would be okay for firmware 130.bin). Now we can rewrite the Firmwarebackup we created above.

<table><tbody><tr><td>&nbsp;</td><td><pre>dd if=backup_firmware of=/dev/sda1
</pre></td></tr></tbody></table>

You may ask why we now write the Firmware to sda1 while we read it from sda2, the answear is simple: Before running fdisk, the iPod was a Mac-iPod with a different Partition layout, but now the iPod is a Windows-iPod, belive me: sda1 is correct.

After writing back the Firmware we can format the iPod:

<table><tbody><tr><td>&nbsp;</td><td><pre>mkfs.vfat -F 32 -n "LUNIX" /dev/sda2
</pre></td></tr></tbody></table>

"LUNIX" is the name of the iPod, you can use another name if you like. After mkfs.vfat is done, we remove sbp2:

Unplug the iPod and pray. If everything went well, the iPod boots up :). If not, reread this section, if you are lost, feel free to drop me a mail: bug-gnupod@nongnu.org (Btw: If you can't get the iPod into diskmode again, try this: Reboot the iPod by pressing 'MENU+PLAY' ~ 5 seconds. While the iPod is booting, press (and hold) |<<+>>| (=Forced Diskmode))

It's a good idea to edit `/etc/fstab` and add a line for the iPod:

<table><tbody><tr><td>&nbsp;</td><td><pre>/dev/sda2   /mnt/ipod   vfat   defaults,user,noauto,umask=000
</pre></td></tr></tbody></table>

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC6"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC8"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 3.4 Firmware update

\*\* Don't update the Firmware just for fun, only do it if you need a new Firmware or/and the documentation told you to do this \*\*

Note: This steps do not work on late 2007 iPods (such as Classic, Touch and 3th gen. Nano).

Setup Firewire (or USB) as described in 'Using FireWire with GNU/Linux', load the modules and make sure sbp2 detected your iPod. Mount the iPod and run `mktunes.pl` to bring the device into a 'clean' state. Unmount the iPod after mktunes.pl finished but do \*not\* unplug the iPod. Ready? Ok, we assume your iPod is `/dev/sda`:

First you need to get a new Firmware. Checkout the latest firmware list:

<table><tbody><tr><td>&nbsp;</td><td><pre>wget -O list.gz http://ax.phobos.apple.com.edgesuite.net//WebObjects/MZStore.woa/wa/com.apple.jingle.appserver.client.MZITunesClientCheck/version
gunzip list.gz
</pre></td></tr></tbody></table>

Open the list in a text editor and find the correct Fimrware-URL for iPod model:

<table><tbody><tr><td>&nbsp;</td><td><pre>    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-3877.20070914.n9gGb/iPod_24.1.0.1.ipsw&lt;/string&gt;  iPod Classic (2007)
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2790.20061206.iPr9t/iPod_25.1.2.1.ipsw&lt;/string&gt;  iPod Video late 5th Gen (30 or 80 gb)
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-3878.20070914.P0omB/iPod_26.1.0.1.ipsw&lt;/string&gt;  ipod Nano 3th Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-3326.20070507.0Pm87/iPod_29.1.1.3.ipsw&lt;/string&gt;  iPod Nano 2nd Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-3316.20070618.9n1bC/iPod_130.1.0.3.ipsw&lt;/string&gt; iPod Shuffle 2nd Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-3317.20070618.nBh6t/iPod_131.1.0.3.ipsw&lt;/string&gt; iPod Shuffle 2nd Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2975.20061218.in8Uq/iPod_128.1.1.5.ipsw&lt;/string&gt; iPod Shuffle 1st Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2692.20060912.pODcW/iPod_10.3.1.1.ipsw&lt;/string&gt;  iPod Clickwheel
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2694.20060912.ipDcD/iPod_11.1.2.1.ipsw&lt;/string&gt;  iPod Photo
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2788.20061206.nS1yA/iPod_13.1.2.1.ipsw&lt;/string&gt;  iPod 5th Gen.
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-3190.20070315.p0oj7/iPod_14.1.3.1.ipsw&lt;/string&gt;  iPod Nano 1st Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-3191.20070315.BgV6t/iPod_17.1.3.1.ipsw&lt;/string&gt;  iPod Nano 1st Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-3325.20070507.KnB7v/iPod_19.1.1.3.ipsw&lt;/string&gt;  iPod Nano 2nd Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2686.20060912.ipTsW/iPod_1.1.5.ipsw&lt;/string&gt;     Scroll-Wheel iPod (1st iPod ever)
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2687.20060912.IPwdC/iPod_2.2.3.ipsw&lt;/string&gt;     iPod 'Dock connector'
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2688.20060912.iDMni/iPod_3.1.4.1.ipsw&lt;/string&gt;   iPod mini 1st Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2691.20060912.ipDcw/iPod_4.3.1.1.ipsw&lt;/string&gt;   iPod Clickwheel
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2693.20060912.PdwCD/iPod_5.1.2.1.ipsw&lt;/string&gt;   iPod Photo
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2689.20060912.ipDmn/iPod_6.1.4.1.ipsw&lt;/string&gt;   iPod mini 1st Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2690.20060912.PdMin/iPod_7.1.4.1.ipsw&lt;/string&gt;   iPod mini 2nd Generation (?)
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2953.20061218.yRet5/iPod_129.1.1.5.ipsw&lt;/string&gt; iPod Shuffle 1st Generation
    &lt;string&gt;http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2789.20061206.9IIut/iPod_20.1.2.1.ipsw&lt;/string&gt;  iPod 5th Gen.
</pre></td></tr></tbody></table>

Download the correct firmware image of your iPod (http://docs.info.apple.com/article.html?artnum=61688 should help you identify our iPod model) and extract it:

<table><tbody><tr><td>&nbsp;</td><td><pre># Example for ipod photo: iPod_11.1.2.1.ipsw : 11 = Model (Photo) 1.2.1 = Firmware version
wget http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPod/SBML/osx/bundles/061-2694.20060912.ipDcD/iPod_11.1.2.1.ipsw
unzip iPod_11.1.2.1.ipsw 
  Archive:  iPod_11.1.2.1.ipsw
    inflating: Firmware-11.4.2.1       
    inflating: manifest.plist          
</pre></td></tr></tbody></table>

Ok, we are now ready to write the new firmware to the iPod.

If your iPod is HFS+ Formatted (your kernel supports 'mac-style' partitions??), use

<table><tbody><tr><td>&nbsp;</td><td><pre>dd if=Firmware-11.4.2.1 of=/dev/sda2  # &lt;-- this is the extracted image, do NOT write the .ipsw file!
sync
</pre></td></tr></tbody></table>

to upgrade the Firmware. If you own a FAT32 Formatted iPod (most common), use

<table><tbody><tr><td>&nbsp;</td><td><pre>dd if=Firmware-11.4.2.1 of=/dev/sda1 # &lt;-- this is the extracted image, do NOT write the .ipsw file!
sync
</pre></td></tr></tbody></table>

After `dd` finished (it can take some time), run a `sync` and unplug the iPod.

Please note: Your Warranty Is Now Void ;-)

And please don't blame me if your iPod dies...

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC7"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC9"> &gt; </a>]</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC3"> &lt;&lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC22"> &gt;&gt; </a>]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4\. Using GNUpod

> <table><tbody><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC9">4.1 Preparation</a></td><td>&nbsp;&nbsp;</td><td>How to mount and prepare the iPod for GNUpod</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC10">4.2 Configuration</a></td><td>&nbsp;&nbsp;</td><td>Learn about the Configuartion File</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC11">4.3 Add files</a></td><td>&nbsp;&nbsp;</td><td>How to add MP3 files to the iPod</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC12">4.4 Search files</a></td><td>&nbsp;&nbsp;</td><td>How to search for files on the iPod</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC13">4.5 Remove files</a></td><td>&nbsp;&nbsp;</td><td>How to delete files on the iPod</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC14">4.6 Edit tags</a></td><td>&nbsp;&nbsp;</td><td>How to change/edit/rename</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC15">4.7 Creating playlists</a></td><td>&nbsp;&nbsp;</td><td>How to create a playlist</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC16">4.8 Dealing with podcasts</a></td><td>&nbsp;&nbsp;</td><td>How to create a podcast playlist</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC17">4.9 Adding cover artwork</a></td><td>&nbsp;&nbsp;</td><td>How to edit/add artwork.</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC18">4.10 Unplug the iPod</a></td><td>&nbsp;&nbsp;</td><td>How to unplug the iPod (Not a joke.. read it)</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC19">4.11 Recovering files</a></td><td>&nbsp;&nbsp;</td><td>How to rebuild the Database if you lost the iTunesDB &amp; GNUtunesDB</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC20">4.12 Coexistence</a></td><td>&nbsp;&nbsp;</td><td>iTunes/Music Match/xtunes/Ehpod user? Read this!</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC21">4.13 Late 2007 iPods</a></td><td>&nbsp;&nbsp;</td><td>Information about iPod Classic, Touch and 3th gen Nano</td></tr></tbody></table>

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC8"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC10"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.1 Preparation

Mount the iPod (i assume you mount it at /mnt/ipod) as described in 'Using FireWire with GNUpod'

If the iPod is freshly formatted or you never used GNUpod before with this iPod, run

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_INIT.pl -m /mnt/ipod
</pre></td></tr></tbody></table>

gnupod\_INIT.pl will create the default directory tree and creates an empty GNUtunesDB (or if it finds an iTunesDB, it runs tunes2pod.pl to convert the iTunesDB to an GNUtunesDB)

Use

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_INIT.pl -m /mnt/ipod --france
</pre></td></tr></tbody></table>

if you would like to enable the 'EU-Volume-Limit' (=decrase max. volume). This only works for iPods running Firmware 1.x

Your iPod is now ready for GNUpod!

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC9"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC11"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.2 Configuration

(Note: You don't need to bother about the Configfile. GNUpod works fine without it, but it could make your life easier)

GNUpod >= 0.95 can read a simple Configfile. An example comes with GNUpod, see doc/gnupodrc.example

Edit this file and save it as ~/.gnupodrc or on your iPod (iPod\_Control/.gnupod/gnupodrc)

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC10"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC12"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.3 Add files

To add files, we use the script called `gnupod_addsong.pl`.

First, mount the iPod (eg. at /mnt/ipod) if it isn't mounted.

If you would like to add the file /tmp/foo.mp3, run gnupod\_addsong.pl like this:

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_addsong.pl -m /mnt/ipod /tmp/foo.mp3
</pre></td></tr></tbody></table>

You can also use wildcards:

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_addsong.pl -m /mnt/ipod /mnt/mp3/seiken_densetsu2_ost/* /mnt/mp3/xenogears/ost?/*
</pre></td></tr></tbody></table>

It isn't possible to add the same MP3 multiple times, gnupod\_addsong.pl detects duplicates (Duplicate = same filesize/time and ID3Tag name). You can disable the duplicate-detection with the '--duplicate' switch.

gnupod\_addsong.pl understands MP3/WAV (RIFF) and M4A (Apple AAC - NO DRM!) files.

It can also convert FLAC and OGG files on-the-fly:

Using this example, it would convert the two files into MP3 and add them to the iPod.

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_addsong.pl -m /mnt/ipod myfile.flac myfile.ogg --decode=mp3
</pre></td></tr></tbody></table>

(Note: To use all features of --decode, you will have to install Audio::FLAC::Header, Ogg::Vorbis::Header::PurePerl, lame, flac, oggenc and faac)

gnupod\_addsong.pl tries to 'auto-detect' the encoding of the ID3 Tag. Sometimes this works (in most cases ;) ) sometimes it doesn't. If it doesn't work for you, feel free do send me an example-file: pab@blinkenligts.ch

DO NOT umount the iPod yet! First read the section 'Unplug the iPod'!

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC11"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC13"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.4 Search files

GNUpod includes a tool called `gnupod_search.pl` which helps you searching for files.

Maybe you would like to search for the artist called 'Schlummiguch'. In this case, run

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_search.pl -m /mnt/ipod -a "Schlummiguch"
</pre></td></tr></tbody></table>

Note: gnupod\_search.pl assumes RegExp input. Please have a look at `gnupod_search.pl --help` for more information.

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC12"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC14"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.5 Remove files

Removing files is done using `gnupod_search.pl -d`. To Remove all files from the artist 'Schlummiguch', run

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_search.pl -m /mnt/ipod -a "Schlummiguch" -d
</pre></td></tr></tbody></table>

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC13"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC15"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.6 Edit tags

You can use `gnupod_search.pl` to edit tags (like artist, album, etc..)

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_search.pl --artist="Alfred Neumann" --rename="artist=John Doe" --rename="rating=100"
</pre></td></tr></tbody></table>

This example searches all files from 'Alfred Neumann', changes the artist into 'Johne Doe' and sets the rating to 5 Stars (5\*20=100)

Don't forget to run mktunes.pl!

You could also edit the GNUtunesDB.xml with a text editor :-)

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC14"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC16"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.7 Creating playlists

Open the file `iPod_Control/.gnupod/GNUtunesDB` in a editor (It's a XML File).

To create a playlist named 'sweet' which holds the songs with the ID 1 and 2, create something like this:

<table><tbody><tr><td>&nbsp;</td><td><pre>&lt;playlist name="sweet"&gt;
 &lt;add id="1" /&gt;
 &lt;add id="2" /&gt;
&lt;/playlist&gt;
</pre></td></tr></tbody></table>

You are not limited to use 'id', you can also use other attributes:

<table><tbody><tr><td>&nbsp;</td><td><pre>&lt;playlist name="bogus"&gt;
 &lt;add album="seiken densetsu" bitrate="256" /&gt;
&lt;/playlist&gt;
</pre></td></tr></tbody></table>

This would add every song from the album 'Seiken Densetsu' (<add.. is case INsensitive) with a bitrate of 256kbit/s.

Since GNUpod 0.26 it's also possible to use Regular Expressions (Regex). See `perldoc perlre` to learn more about this

<table><tbody><tr><td>&nbsp;</td><td><pre>&lt;playlist name="Regex Demo"&gt;
 &lt;regex album="^A" /&gt;
 &lt;iregex album="^b" /&gt;
&lt;/playlist&gt;
</pre></td></tr></tbody></table>

<regex is case sensitive, use <iregex to do case insensitive matching.

It's also possible to sort a playlist:

<table><tbody><tr><td>&nbsp;</td><td><pre>&lt;playlist name="By Album" sort="album"&gt;
 &lt;regex artist="bach" /&gt;
&lt;/playlist&gt;
</pre></td></tr></tbody></table>

This adds all songs from Bach, sorted by album (a..z). You can use every `<file ..>` item (id, bitrate, title..) for `sort`. Add 'reverse ' at the beginning, to reverse the sorting:

<table><tbody><tr><td>&nbsp;</td><td><pre>&lt;playlist name="By Title" sort="reverse title"&gt;
 &lt;regex artist="U2" /&gt;
&lt;/playlist&gt;
</pre></td></tr></tbody></table>

You can also use Smart-Playlists with Firmware >= 2.x

<table><tbody><tr><td>&nbsp;</td><td><pre> &lt;smartplaylist checkrule="spl" liveupdate="1" name="Example SPL1" &gt;
   &lt;spl action="eq" field="playcount" string="0" /&gt;
   &lt;spl action="IS" field="artist" string="Jon Doe" /&gt;
 &lt;/smartplaylist&gt;
 
  &lt;smartplaylist checkrule="spl" liveupdate="1" name="Example SPL2" &gt;
   &lt;spl action="gt" field="bitrate" string="311" /&gt;
 &lt;/smartplaylist&gt;
</pre></td></tr></tbody></table>

'Example SPL1' matches all songs from 'Jon Doe' with playcount==0 (= All songs from Jon Doe never played until yet) 'Example SPL2' matches all songs with a Bitrate > 331. (See also README.smartplaylists)

For more examples have a look at `doc/gnutunesdb.example` included in the GNUpod tarball. Also checkout http://blinkenlights.ch/gnupod/mkspl.html for a 'JavaScript SPL-Creator'

You can also use the --playlist option of gnupod\_addsong.pl. This will create and add the listed songs to the named playlist.

Don't forget to run mktunes before umounting! (See 'Unplug the iPod')

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC15"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC17"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.8 Dealing with podcasts

To create a podcast playlist you just need to set the podcast flag to '1':

<table><tbody><tr><td>&nbsp;</td><td><pre> &lt;playlist name="Test Podcast" podcast="1"&gt;
   &lt;iregex artist="John Doe" /&gt;
 &lt;/playlist&gt;
</pre></td></tr></tbody></table>

Such a playlist will show up as a Podcast after running mktunes.pl

gnupod\_addsong.pl can also download podcasts and create such playlists itself:

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_addsong.pl -p "Heute Morgen" --playlist-is-podcast http://pod.drs.ch/heutemorgen_mpx.xml
</pre></td></tr></tbody></table>

Running this command will create a Playlist called 'Heute Morgen' (`-p`) and set `podcast="1"` (`--playlist-is-podcast`). `gnupod_addsong.pl` will then fetch the podcast from `http://pod.drs.ch/heutemorgen_mpx.xml`, download all (new) files and add them to the 'Heute Morgen' playlist!

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC16"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC18"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.9 Adding cover artwork

GNUpod can write cover artwork for video, nano and late 2007-nano iPods. The internal image format is model specific, so you should give GNUpod a hint about the image format it should use.

If you own a video (compatible) iPod, set: in your gnupod configuration file (found at ~/.gnupodrc or $IPOD\_MOUNTPOINT/iPod\_Control/.gnupod/gnupodrc , see doc/gnupodrc.exmaple for more details). For the iPod nano you should use: Late 2007-nanos need this setting:

To specify a cover while adding files you'd use the `--artwork` switch of `gnupod_addsong.pl`. Example:

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_addsong.pl --artwork cover.jpg *.mp3
</pre></td></tr></tbody></table>

Use `gnupod_search.pl` to change/add artwork for existing files. Example:

<table><tbody><tr><td>&nbsp;</td><td><pre># Set cover.jpg as artwork for all songs that match album =~ /Katamari/i
gnupod_search.pl --artwork cover.jpg --album Katamari
</pre></td></tr></tbody></table>

don't forget to run `mktunes.pl` afterwards.

Note: Artwork added by GNUpod may vanish after using iTunes: GNUpod does not inject the artwork into the id3-header of the file. If iTunes finds such a file (while scanning / changing tags) the artwork may get dropped.

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC17"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC19"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.10 Unplug the iPod

Before umounting the iPod, you have to call `mktunes.pl` which will parse the GNUtunesDB XML file and convert it into the iTunesDB format.

Simply run

Note: Since GNUpod 0.91, mktunes.pl has a '--volume' option which you can use to boost the Volume.

<table><tbody><tr><td>&nbsp;</td><td><pre>mktunes.pl -m /mnt/ipod --volume 40
</pre></td></tr></tbody></table>

This would adjust the volume +40 percent. (You can also use '-100' to get a silent iPod ;) )

After `mktunes.pl` is done, you can umount the iPod and remove the sbp2 module

<table><tbody><tr><td>&nbsp;</td><td><pre>umount /mnt/ipod
rmmod sbp2
</pre></td></tr></tbody></table>

Added songs won't be visible on the iPod if you did not run mktunes.pl before umounting the iPod. (If you forgot to run `mktunes.pl` before unpluging/umounting, simply mount the iPod again and run it)

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC18"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC20"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.11 Recovering files

If your computer crashed while uploading/deleting songs, you may have some 'zombie' files.

In this case, you can use 'gnupod\_check.pl' to search 'lost' files. gnupod\_check.pl will tell you what you could do to fix it.

If gnupod\_check.pl found many errors (or you lost your GNUtunesDB.xml), you can 'rebuild' an GNUtunesDB using `gnupod_addsong.pl`

<table><tbody><tr><td>&nbsp;</td><td><pre>gnupod_addsong.pl --restore -m /mnt/ipod
</pre></td></tr></tbody></table>

First, it will create a clean, empty GNUtunesDB, it won't delete any songs on the iPod. Then, `gnupod_addsong.pl --restore` will re-create a GNUtunesDB including the Songs which are on the iPod

I think nobody will ever have to do this.. but it maybe usefull to know that it's possible (Note: Of course you'll lose your Playlists)

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC19"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC21"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.12 Coexistence

GNUpod can coexist with iTunes and other programs for the iPod.

If you want to use an iPod with GNUpod and used something other than GNUpod (maybe iTunes) to perform the last update (adding songs, editing playists.. doing something..), you'll have to use `tunes2pod.pl` to update the (outdatet) GNUtunesDB.

Mount the iPod and run

<table><tbody><tr><td>&nbsp;</td><td><pre>tunes2pod.pl -m /mnt/ipod
</pre></td></tr></tbody></table>

The iPod is now ready again for GNUpod.

You have to do this because GNUpod stores it's information in the GNUtunesDB, other programs are accessing the iTunesDB directly. After you did something with eg. iTunes, the GNUtunesDB would be 'outdatet' and you would lose any changes you made with iTunes. Running `tunes2pod.pl` will write a new GNUtunesDB which reflects the content of the current iTunesDB.

You sould avoid the use of 'extended playlist support' if you use your iPod with other programs.

The Playlist part of this file...

<table><tbody><tr><td>&nbsp;</td><td><pre>&lt;files&gt;
&lt;file id="1" title="hello" album="foo"..
&lt;file id="2" title="boing" album="foo"..
&lt;/files&gt;
&lt;playlist name="extended"&gt;
 &lt;add album="foo" /&gt;
&lt;/playlist&gt;
</pre></td></tr></tbody></table>

..would look like this after using tunes2pod.pl

<table><tbody><tr><td>&nbsp;</td><td><pre>...
&lt;playist name="extended"&gt;
 &lt;add id="1" /&gt;
 &lt;add id="2" /&gt;
&lt;/playlist&gt;
</pre></td></tr></tbody></table>

The songs are still in the playlists, but the expressions you wrote are 'lost'.

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC20"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC22"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 4.13 Late 2007 iPods

Late 2007 iPod models (3gen Nano, Classic, Touch) refuse to work unless the iTunesDB has been signed with a sha1 hash. This hash helps to detect corrupted databases, prevents sharing an iTunesDB between multiple iPods and locks out non-apple software. GNUpod is able to create the required hash value if it knows the iPods serial number, this is a 16 chars long hex value such as: `000ba3100310abcf` and should be autodetected on GNU/Linux (via `/proc/bus/usb/devices`) and Solaris (via `prtconf -v`). If GNUpod somehow fails to find the correct serial number of your iPod you'll have to specify the correct value using the `--fwguid` switch of `mktunes.pl`.

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC21"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC23"> &gt; </a>]</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC8"> &lt;&lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC27"> &gt;&gt; </a>]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 5\. Problems

> <table><tbody><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC23">5.1 GNUtunesDB</a></td><td>&nbsp;&nbsp;</td><td>What is the GNUtunesDB?</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC24">5.2 Get rid of '-m'</a></td><td>&nbsp;&nbsp;</td><td>You don't like the -m switch?</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC25">5.3 Known bugs and limitations</a></td><td>&nbsp;&nbsp;</td><td>GNUpod isn't perfect :)</td></tr><tr><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC26">5.4 Reporting Bugs</a></td><td>&nbsp;&nbsp;</td><td>How to report a Bug</td></tr></tbody></table>

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC22"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC24"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 5.1 GNUtunesDB

We talked alot about the 'GNUtunesDB' and the 'iTunesDB' files, but why do we need this two files and what's the difference ?

Well, you can find the iTunesDB on your iPod at `iPod_Control/iTunes/iTunesDB` . This file is read by the iPod when you 'boot' the device. The iTunesDB is a small Database and stores information about all MP3s on the iPod (Title, Artist, Path, Bitrate...) and all Playlists: everything the iPod needs to know.

The iTunesDB is a proprietary file format created by Apple.

The GNUtunesDB (`iPod_Control/.gnupod/GNUtunesDB`) holds the same information like the iTunesDB, but it's a simple XML file: easy to understand by humans and easy to edit by hand.

Everytime you run `tunes2pod.pl`, the iTunesDB will get parsed and converted into an XML File (the GNUtunesDB). `mktunes.pl` does the opposite: it parses the XML file and creates an iTunesDB (for the iPod and iTunes)

Only mktunes.pl and tunes2pod.pl have to worry about the iTunesDB format: all other tools (gnupod\_addsong.pl for example) only have to deal with the XML file called GNUtunesDB.

It's important to keep the iTunesDB and GNUtunesDB 'in sync', so everytime you changed the GNUtunesDB (by hand or using gnupod\_something.pl) you'll have to run `mktunes.pl`.

If 'you' changed the iTunesDB (using gtkPod/iTunes/Ehpod), run `tunes2pod.pl` \*before\* using any other GNUpod commands.

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC23"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC25"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 5.2 Get rid of '-m'

You don't have to use the '-m' switch if you set IPOD\_MOUNTPOINT. (Example for the BASH)

<table><tbody><tr><td>&nbsp;</td><td><pre>export IPOD_MOUNTPOINT="/mnt/ipod"
</pre></td></tr></tbody></table>

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC24"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC26"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 5.3 Known bugs and limitations

-   Smartplaylist support is incomplete (No liveupdate)
-   GNUpod doesn't like Audible.com and DRM Files

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC25"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC27"> &gt; </a>]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## 5.4 Reporting Bugs

To report a bug, send a mail to bug-gnupod@nongnu.org

Include as much information as possible.

You may want to attach the files iPod\_Control/.gnupod/GNUtunesDB and iPod\_Control/iTunes/iTunesDB. But please use gzip or bzip2 to compress the files.

Please do not send me any mp3 files without asking me.

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC26"> &lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC28"> &gt; </a>]</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC22"> &lt;&lt; </a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

## A. GNU Free Documentation License

Version 1.2, November 2002

<table><tbody><tr><td>&nbsp;</td><td><pre>Copyright (C) 2000,2001,2002 Free Software Foundation, Inc.
59 Temple Place, Suite 330, Boston, MA  02111-1307, USA

Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed.
</pre></td></tr></tbody></table>

1.  PREAMBLE
    
    The purpose of this License is to make a manual, textbook, or other functional and useful document _free_ in the sense of freedom: to assure everyone the effective freedom to copy and redistribute it, with or without modifying it, either commercially or noncommercially. Secondarily, this License preserves for the author and publisher a way to get credit for their work, while not being considered responsible for modifications made by others.
    
    This License is a kind of "copyleft", which means that derivative works of the document must themselves be free in the same sense. It complements the GNU General Public License, which is a copyleft license designed for free software.
    
    We have designed this License in order to use it for manuals for free software, because free software needs free documentation: a free program should come with manuals providing the same freedoms that the software does. But this License is not limited to software manuals; it can be used for any textual work, regardless of subject matter or whether it is published as a printed book. We recommend this License principally for works whose purpose is instruction or reference.
    
2.  APPLICABILITY AND DEFINITIONS
    
    This License applies to any manual or other work, in any medium, that contains a notice placed by the copyright holder saying it can be distributed under the terms of this License. Such a notice grants a world-wide, royalty-free license, unlimited in duration, to use that work under the conditions stated herein. The "Document", below, refers to any such manual or work. Any member of the public is a licensee, and is addressed as "you". You accept the license if you copy, modify or distribute the work in a way requiring permission under copyright law.
    
    A "Modified Version" of the Document means any work containing the Document or a portion of it, either copied verbatim, or with modifications and/or translated into another language.
    
    A "Secondary Section" is a named appendix or a front-matter section of the Document that deals exclusively with the relationship of the publishers or authors of the Document to the Document's overall subject (or to related matters) and contains nothing that could fall directly within that overall subject. (Thus, if the Document is in part a textbook of mathematics, a Secondary Section may not explain any mathematics.) The relationship could be a matter of historical connection with the subject or with related matters, or of legal, commercial, philosophical, ethical or political position regarding them.
    
    The "Invariant Sections" are certain Secondary Sections whose titles are designated, as being those of Invariant Sections, in the notice that says that the Document is released under this License. If a section does not fit the above definition of Secondary then it is not allowed to be designated as Invariant. The Document may contain zero Invariant Sections. If the Document does not identify any Invariant Sections then there are none.
    
    The "Cover Texts" are certain short passages of text that are listed, as Front-Cover Texts or Back-Cover Texts, in the notice that says that the Document is released under this License. A Front-Cover Text may be at most 5 words, and a Back-Cover Text may be at most 25 words.
    
    A "Transparent" copy of the Document means a machine-readable copy, represented in a format whose specification is available to the general public, that is suitable for revising the document straightforwardly with generic text editors or (for images composed of pixels) generic paint programs or (for drawings) some widely available drawing editor, and that is suitable for input to text formatters or for automatic translation to a variety of formats suitable for input to text formatters. A copy made in an otherwise Transparent file format whose markup, or absence of markup, has been arranged to thwart or discourage subsequent modification by readers is not Transparent. An image format is not Transparent if used for any substantial amount of text. A copy that is not "Transparent" is called "Opaque".
    
    Examples of suitable formats for Transparent copies include plain ASCII without markup, Texinfo input format, LaTeX input format, SGML or XML using a publicly available DTD, and standard-conforming simple HTML, PostScript or PDF designed for human modification. Examples of transparent image formats include PNG, XCF and JPG. Opaque formats include proprietary formats that can be read and edited only by proprietary word processors, SGML or XML for which the DTD and/or processing tools are not generally available, and the machine-generated HTML, PostScript or PDF produced by some word processors for output purposes only.
    
    The "Title Page" means, for a printed book, the title page itself, plus such following pages as are needed to hold, legibly, the material this License requires to appear in the title page. For works in formats which do not have any title page as such, "Title Page" means the text near the most prominent appearance of the work's title, preceding the beginning of the body of the text.
    
    A section "Entitled XYZ" means a named subunit of the Document whose title either is precisely XYZ or contains XYZ in parentheses following text that translates XYZ in another language. (Here XYZ stands for a specific section name mentioned below, such as "Acknowledgements", "Dedications", "Endorsements", or "History".) To "Preserve the Title" of such a section when you modify the Document means that it remains a section "Entitled XYZ" according to this definition.
    
    The Document may include Warranty Disclaimers next to the notice which states that this License applies to the Document. These Warranty Disclaimers are considered to be included by reference in this License, but only as regards disclaiming warranties: any other implication that these Warranty Disclaimers may have is void and has no effect on the meaning of this License.
    
3.  VERBATIM COPYING
    
    You may copy and distribute the Document in any medium, either commercially or noncommercially, provided that this License, the copyright notices, and the license notice saying this License applies to the Document are reproduced in all copies, and that you add no other conditions whatsoever to those of this License. You may not use technical measures to obstruct or control the reading or further copying of the copies you make or distribute. However, you may accept compensation in exchange for copies. If you distribute a large enough number of copies you must also follow the conditions in section 3.
    
    You may also lend copies, under the same conditions stated above, and you may publicly display copies.
    
4.  COPYING IN QUANTITY
    
    If you publish printed copies (or copies in media that commonly have printed covers) of the Document, numbering more than 100, and the Document's license notice requires Cover Texts, you must enclose the copies in covers that carry, clearly and legibly, all these Cover Texts: Front-Cover Texts on the front cover, and Back-Cover Texts on the back cover. Both covers must also clearly and legibly identify you as the publisher of these copies. The front cover must present the full title with all words of the title equally prominent and visible. You may add other material on the covers in addition. Copying with changes limited to the covers, as long as they preserve the title of the Document and satisfy these conditions, can be treated as verbatim copying in other respects.
    
    If the required texts for either cover are too voluminous to fit legibly, you should put the first ones listed (as many as fit reasonably) on the actual cover, and continue the rest onto adjacent pages.
    
    If you publish or distribute Opaque copies of the Document numbering more than 100, you must either include a machine-readable Transparent copy along with each Opaque copy, or state in or with each Opaque copy a computer-network location from which the general network-using public has access to download using public-standard network protocols a complete Transparent copy of the Document, free of added material. If you use the latter option, you must take reasonably prudent steps, when you begin distribution of Opaque copies in quantity, to ensure that this Transparent copy will remain thus accessible at the stated location until at least one year after the last time you distribute an Opaque copy (directly or through your agents or retailers) of that edition to the public.
    
    It is requested, but not required, that you contact the authors of the Document well before redistributing any large number of copies, to give them a chance to provide you with an updated version of the Document.
    
5.  MODIFICATIONS
    
    You may copy and distribute a Modified Version of the Document under the conditions of sections 2 and 3 above, provided that you release the Modified Version under precisely this License, with the Modified Version filling the role of the Document, thus licensing distribution and modification of the Modified Version to whoever possesses a copy of it. In addition, you must do these things in the Modified Version:
    
    1.  Use in the Title Page (and on the covers, if any) a title distinct from that of the Document, and from those of previous versions (which should, if there were any, be listed in the History section of the Document). You may use the same title as a previous version if the original publisher of that version gives permission.
    2.  List on the Title Page, as authors, one or more persons or entities responsible for authorship of the modifications in the Modified Version, together with at least five of the principal authors of the Document (all of its principal authors, if it has fewer than five), unless they release you from this requirement.
    3.  State on the Title page the name of the publisher of the Modified Version, as the publisher.
    4.  Preserve all the copyright notices of the Document.
    5.  Add an appropriate copyright notice for your modifications adjacent to the other copyright notices.
    6.  Include, immediately after the copyright notices, a license notice giving the public permission to use the Modified Version under the terms of this License, in the form shown in the Addendum below.
    7.  Preserve in that license notice the full lists of Invariant Sections and required Cover Texts given in the Document's license notice.
    8.  Include an unaltered copy of this License.
    9.  Preserve the section Entitled "History", Preserve its Title, and add to it an item stating at least the title, year, new authors, and publisher of the Modified Version as given on the Title Page. If there is no section Entitled "History" in the Document, create one stating the title, year, authors, and publisher of the Document as given on its Title Page, then add an item describing the Modified Version as stated in the previous sentence.
    10.  Preserve the network location, if any, given in the Document for public access to a Transparent copy of the Document, and likewise the network locations given in the Document for previous versions it was based on. These may be placed in the "History" section. You may omit a network location for a work that was published at least four years before the Document itself, or if the original publisher of the version it refers to gives permission.
    11.  For any section Entitled "Acknowledgements" or "Dedications", Preserve the Title of the section, and preserve in the section all the substance and tone of each of the contributor acknowledgements and/or dedications given therein.
    12.  Preserve all the Invariant Sections of the Document, unaltered in their text and in their titles. Section numbers or the equivalent are not considered part of the section titles.
    13.  Delete any section Entitled "Endorsements". Such a section may not be included in the Modified Version.
    14.  Do not retitle any existing section to be Entitled "Endorsements" or to conflict in title with any Invariant Section.
    15.  Preserve any Warranty Disclaimers.
    
    If the Modified Version includes new front-matter sections or appendices that qualify as Secondary Sections and contain no material copied from the Document, you may at your option designate some or all of these sections as invariant. To do this, add their titles to the list of Invariant Sections in the Modified Version's license notice. These titles must be distinct from any other section titles.
    
    You may add a section Entitled "Endorsements", provided it contains nothing but endorsements of your Modified Version by various parties--for example, statements of peer review or that the text has been approved by an organization as the authoritative definition of a standard.
    
    You may add a passage of up to five words as a Front-Cover Text, and a passage of up to 25 words as a Back-Cover Text, to the end of the list of Cover Texts in the Modified Version. Only one passage of Front-Cover Text and one of Back-Cover Text may be added by (or through arrangements made by) any one entity. If the Document already includes a cover text for the same cover, previously added by you or by arrangement made by the same entity you are acting on behalf of, you may not add another; but you may replace the old one, on explicit permission from the previous publisher that added the old one.
    
    The author(s) and publisher(s) of the Document do not by this License give permission to use their names for publicity for or to assert or imply endorsement of any Modified Version.
    
6.  COMBINING DOCUMENTS
    
    You may combine the Document with other documents released under this License, under the terms defined in section 4 above for modified versions, provided that you include in the combination all of the Invariant Sections of all of the original documents, unmodified, and list them all as Invariant Sections of your combined work in its license notice, and that you preserve all their Warranty Disclaimers.
    
    The combined work need only contain one copy of this License, and multiple identical Invariant Sections may be replaced with a single copy. If there are multiple Invariant Sections with the same name but different contents, make the title of each such section unique by adding at the end of it, in parentheses, the name of the original author or publisher of that section if known, or else a unique number. Make the same adjustment to the section titles in the list of Invariant Sections in the license notice of the combined work.
    
    In the combination, you must combine any sections Entitled "History" in the various original documents, forming one section Entitled "History"; likewise combine any sections Entitled "Acknowledgements", and any sections Entitled "Dedications". You must delete all sections Entitled "Endorsements."
    
7.  COLLECTIONS OF DOCUMENTS
    
    You may make a collection consisting of the Document and other documents released under this License, and replace the individual copies of this License in the various documents with a single copy that is included in the collection, provided that you follow the rules of this License for verbatim copying of each of the documents in all other respects.
    
    You may extract a single document from such a collection, and distribute it individually under this License, provided you insert a copy of this License into the extracted document, and follow this License in all other respects regarding verbatim copying of that document.
    
8.  AGGREGATION WITH INDEPENDENT WORKS
    
    A compilation of the Document or its derivatives with other separate and independent documents or works, in or on a volume of a storage or distribution medium, is called an "aggregate" if the copyright resulting from the compilation is not used to limit the legal rights of the compilation's users beyond what the individual works permit. When the Document is included an aggregate, this License does not apply to the other works in the aggregate which are not themselves derivative works of the Document.
    
    If the Cover Text requirement of section 3 is applicable to these copies of the Document, then if the Document is less than one half of the entire aggregate, the Document's Cover Texts may be placed on covers that bracket the Document within the aggregate, or the electronic equivalent of covers if the Document is in electronic form. Otherwise they must appear on printed covers that bracket the whole aggregate.
    
9.  TRANSLATION
    
    Translation is considered a kind of modification, so you may distribute translations of the Document under the terms of section 4. Replacing Invariant Sections with translations requires special permission from their copyright holders, but you may include translations of some or all Invariant Sections in addition to the original versions of these Invariant Sections. You may include a translation of this License, and all the license notices in the Document, and any Warrany Disclaimers, provided that you also include the original English version of this License and the original versions of those notices and disclaimers. In case of a disagreement between the translation and the original version of this License or a notice or disclaimer, the original version will prevail.
    
    If a section in the Document is Entitled "Acknowledgements", "Dedications", or "History", the requirement (section 4) to Preserve its Title (section 1) will typically require changing the actual title.
    
10.  TERMINATION
    
    You may not copy, modify, sublicense, or distribute the Document except as expressly provided for under this License. Any other attempt to copy, modify, sublicense or distribute the Document is void, and will automatically terminate your rights under this License. However, parties who have received copies, or rights, from you under this License will not have their licenses terminated so long as such parties remain in full compliance.
    
11.  FUTURE REVISIONS OF THIS LICENSE
    
    The Free Software Foundation may publish new, revised versions of the GNU Free Documentation License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns. See [http://www.gnu.org/copyleft/](http://www.gnu.org/copyleft/).
    
    Each version of the License is given a distinguishing version number. If the Document specifies that a particular numbered version of this License "or any later version" applies to it, you have the option of following the terms and conditions either of that specified version or of any later version that has been published (not as a draft) by the Free Software Foundation. If the Document does not specify a version number of this License, you may choose any version ever published (not as a draft) by the Free Software Foundation.
    

___

<table><tbody><tr><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC27"> &lt; </a>]</td><td>[ &gt; ]</td><td>&nbsp;</td><td>[ &lt;&lt; ]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top"> Up </a>]</td><td>[ &gt;&gt; ]</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Top">Top</a>]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_Contents">Contents</a>]</td><td>[Index]</td><td>[<a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC_About"> ? </a>]</td></tr></tbody></table>

### A.0.1 ADDENDUM: How to use this License for your documents

To use this License in a document you have written, include a copy of the License in the document and put the following copyright and license notices just after the title page:

<table><tbody><tr><td>&nbsp;</td><td><span size="-1"></span><pre><span size="-1">  Copyright (C)  <var>year</var>  <var>your name</var>.
  Permission is granted to copy, distribute and/or modify this document
  under the terms of the GNU Free Documentation License, Version 1.2
  or any later version published by the Free Software Foundation;
  with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
  A copy of the license is included in the section entitled ``GNU
  Free Documentation License''.
</span></pre></td></tr></tbody></table>

If you have Invariant Sections, Front-Cover Texts and Back-Cover Texts, replace the "with...Texts." line with this:

<table><tbody><tr><td>&nbsp;</td><td><span size="-1"></span><pre><span size="-1">    with the Invariant Sections being <var>list their titles</var>, with
    the Front-Cover Texts being <var>list</var>, and with the Back-Cover Texts
    being <var>list</var>.
</span></pre></td></tr></tbody></table>

If you have Invariant Sections without Cover Texts, or some other combination of the three, merge those two alternatives to suit the situation.

If your document contains nontrivial examples of program code, we recommend releasing these examples in parallel under your choice of free software license, such as the GNU General Public License, to permit their use in free software.

<table><tbody><tr><th>Jump to: &nbsp;</th><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#cp_D"><b>D</b></a> &nbsp; <a href="https://www.gnu.org/software/gnupod/gnupod.html#cp_F"><b>F</b></a> &nbsp; <a href="https://www.gnu.org/software/gnupod/gnupod.html#cp_I"><b>I</b></a> &nbsp; <a href="https://www.gnu.org/software/gnupod/gnupod.html#cp_R"><b>R</b></a> &nbsp; <a href="https://www.gnu.org/software/gnupod/gnupod.html#cp_S"><b>S</b></a> &nbsp;</td></tr></tbody></table>

  

<table><tbody><tr><td></td><th>Index Entry</th><th>Section</th></tr><tr><td colspan="3"><hr></td></tr><tr><th><a name="cp_D"></a>D</th><td></td><td></td></tr><tr><td></td><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC2">Darwin</a></td><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC2">2. Requirements</a></td></tr><tr><td colspan="3"><hr></td></tr><tr><th><a name="cp_F"></a>F</th><td></td><td></td></tr><tr><td></td><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC27">FDL, GNU Free Documentation License</a></td><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC27">A. GNU Free Documentation License</a></td></tr><tr><td colspan="3"><hr></td></tr><tr><th><a name="cp_I"></a>I</th><td></td><td></td></tr><tr><td></td><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC4">installation</a></td><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC4">3.1 Installation of GNUpod</a></td></tr><tr><td colspan="3"><hr></td></tr><tr><th><a name="cp_R"></a>R</th><td></td><td></td></tr><tr><td></td><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC2">requirements</a></td><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC2">2. Requirements</a></td></tr><tr><td colspan="3"><hr></td></tr><tr><th><a name="cp_S"></a>S</th><td></td><td></td></tr><tr><td></td><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC2">Solaris</a></td><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#SEC2">2. Requirements</a></td></tr><tr><td colspan="3"><hr></td></tr></tbody></table>

<table><tbody><tr><th>Jump to: &nbsp;</th><td><a href="https://www.gnu.org/software/gnupod/gnupod.html#cp_D"><b>D</b></a> &nbsp; <a href="https://www.gnu.org/software/gnupod/gnupod.html#cp_F"><b>F</b></a> &nbsp; <a href="https://www.gnu.org/software/gnupod/gnupod.html#cp_I"><b>I</b></a> &nbsp; <a href="https://www.gnu.org/software/gnupod/gnupod.html#cp_R"><b>R</b></a> &nbsp; <a href="https://www.gnu.org/software/gnupod/gnupod.html#cp_S"><b>S</b></a> &nbsp;</td></tr></tbody></table>

  

___

## Table of Contents

[1\. GNUpod](https://www.gnu.org/software/gnupod/gnupod.html#SEC1)  
[2\. Requirements](https://www.gnu.org/software/gnupod/gnupod.html#SEC2)  
[3\. Installing GNUpod](https://www.gnu.org/software/gnupod/gnupod.html#SEC3)  

[3.1 Installation of GNUpod](https://www.gnu.org/software/gnupod/gnupod.html#SEC4)  
[3.2 Using FireWire with GNU/Linux](https://www.gnu.org/software/gnupod/gnupod.html#SEC5)  
[3.3 Convert your Mac iPod](https://www.gnu.org/software/gnupod/gnupod.html#SEC6)  
[3.4 Firmware update](https://www.gnu.org/software/gnupod/gnupod.html#SEC7)  

[4\. Using GNUpod](https://www.gnu.org/software/gnupod/gnupod.html#SEC8)  

[4.1 Preparation](https://www.gnu.org/software/gnupod/gnupod.html#SEC9)  
[4.2 Configuration](https://www.gnu.org/software/gnupod/gnupod.html#SEC10)  
[4.3 Add files](https://www.gnu.org/software/gnupod/gnupod.html#SEC11)  
[4.4 Search files](https://www.gnu.org/software/gnupod/gnupod.html#SEC12)  
[4.5 Remove files](https://www.gnu.org/software/gnupod/gnupod.html#SEC13)  
[4.6 Edit tags](https://www.gnu.org/software/gnupod/gnupod.html#SEC14)  
[4.7 Creating playlists](https://www.gnu.org/software/gnupod/gnupod.html#SEC15)  
[4.8 Dealing with podcasts](https://www.gnu.org/software/gnupod/gnupod.html#SEC16)  
[4.9 Adding cover artwork](https://www.gnu.org/software/gnupod/gnupod.html#SEC17)  
[4.10 Unplug the iPod](https://www.gnu.org/software/gnupod/gnupod.html#SEC18)  
[4.11 Recovering files](https://www.gnu.org/software/gnupod/gnupod.html#SEC19)  
[4.12 Coexistence](https://www.gnu.org/software/gnupod/gnupod.html#SEC20)  
[4.13 Late 2007 iPods](https://www.gnu.org/software/gnupod/gnupod.html#SEC21)  

[5\. Problems](https://www.gnu.org/software/gnupod/gnupod.html#SEC22)  

[5.1 GNUtunesDB](https://www.gnu.org/software/gnupod/gnupod.html#SEC23)  
[5.2 Get rid of '-m'](https://www.gnu.org/software/gnupod/gnupod.html#SEC24)  
[5.3 Known bugs and limitations](https://www.gnu.org/software/gnupod/gnupod.html#SEC25)  
[5.4 Reporting Bugs](https://www.gnu.org/software/gnupod/gnupod.html#SEC26)  

[A. GNU Free Documentation License](https://www.gnu.org/software/gnupod/gnupod.html#SEC27)  

[A.0.1 ADDENDUM: How to use this License for your documents](https://www.gnu.org/software/gnupod/gnupod.html#SEC28)  

___

## Short Table of Contents

> [1\. GNUpod](https://www.gnu.org/software/gnupod/gnupod.html#SEC1)  
> [2\. Requirements](https://www.gnu.org/software/gnupod/gnupod.html#SEC2)  
> [3\. Installing GNUpod](https://www.gnu.org/software/gnupod/gnupod.html#SEC3)  
> [4\. Using GNUpod](https://www.gnu.org/software/gnupod/gnupod.html#SEC8)  
> [5\. Problems](https://www.gnu.org/software/gnupod/gnupod.html#SEC22)  
> [A. GNU Free Documentation License](https://www.gnu.org/software/gnupod/gnupod.html#SEC27)  

___

## About this document

This document was generated by _AU_ on _September, 26 2007_ using [_texi2html_](http://www.mathematik.uni-kl.de/~obachman/Texi2html) The buttons in the navigation panels have the following meaning:

| Button | Name | Go to | From 1.2.3 go to |
| --- | --- | --- | --- |
| \[ < \] | Back | previous section in reading order | 1.2.2 |
| \[ > \] | Forward | next section in reading order | 1.2.4 |
| \[ << \] | FastBack | previous or up-and-previous section | 1.1 |
| \[ Up \] | Up | up section | 1.2 |
| \[ >> \] | FastForward | next or up-and-next section | 1.3 |
| \[Top\] | Top | cover (top) of document |   |
| \[Contents\] | Contents | table of contents |   |
| \[Index\] | Index | concept index |   |
| \[ ? \] | About | this page |   |

where the **Example** assumes that the current position is at **Subsubsection One-Two-Three** of a document of the following structure:

-   1\. Section One

-   1.1 Subsection One-One

-   ...

-   1.2 Subsection One-Two

-   1.2.1 Subsubsection One-Two-One
-   1.2.2 Subsubsection One-Two-Two
-   1.2.3 Subsubsection One-Two-Three     **<== Current Position**
-   1.2.4 Subsubsection One-Two-Four

-   1.3 Subsection One-Three

-   ...

-   1.4 Subsection One-Four

___

  
This document was generated by _AU_ on _September, 26 2007_ using [_texi2html_](http://www.mathematik.uni-kl.de/~obachman/Texi2html)
