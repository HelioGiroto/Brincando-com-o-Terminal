<div align="center">

  <h1>Comandos Termux </h1>
  
  <p>
	Bem-vindo ao Manual de Comandos do Termux, seu guia abrangente para os comandos do Termux organizados em vários capítulos para fácil referência.
  </p>

  <!-- Badges -->
  <p>
    <a href="https://github.com/BlackTechX011/Termux-Command-Handbook" title="Go to GitHub repo"><img src="https://img.shields.io/static/v1?label=BlackTechX&message=Termux-Command-Handbook&color=blue&logo=github" alt="BlackTechX - Termux Command Handbook"></a>
 
  </p>

  <h4>
    <a href="https://www.GitHub.com/BlackTechX011/">GITHUB</a>
  </h4>
</div>

<br />



# Índice

- [Introdução ao Termux](# )
- [Capítulos](# )
- [Capítulo 1: Comandos Básicos](# )
- [Capítulo 2: Comandos Avançados](# )
- [Capítulo 3: Comandos de Desenvolvedor](# )
- [Capítulo 4: Comandos de Especialista](# )
- [Capítulo 5: Comandos Mestre](# )
- [Capítulo 6: Comandos de Usuário Avançado](# )
- [Capítulo 7: Comandos de Desenvolvedor](# )
- [Capítulo 8: Administração de Sistemas](# )
- [Capítulo 8: Comandos de administração de sistemas](# )
- [Capítulo 9: Comandos de administração de rede](# )
- [Capítulo 10: Comandos de gerenciamento de dados](# )



## Introdução ao Termux

Termux é um poderoso emulador de terminal de código aberto e ambiente Linux para Android que permite aos usuários executar vários utilitários Linux e linguagens de programação em seus dispositivos móveis. Com o Termux, os usuários podem acessar um ambiente completo de linha de comando Linux diretamente em seus smartphones ou tablets, permitindo que eles executem uma ampla gama de tarefas, desde a manipulação básica de arquivos até tarefas avançadas de desenvolvimento e administração do sistema.


## Capítulos

### [Capítulo 1: Comandos Básicos]()
- Aprenda comandos essenciais do Termux para navegação, manipulação de arquivos e operações básicas do sistema.

### [Capítulo 2: Comandos Avançados]()
- Explore comandos avançados do Termux para administração de sistemas, redes e personalização.

### [Capítulo 3: Comandos para Desenvolvedores]()
- Descubra comandos do Termux específicos para desenvolvedores, incluindo ferramentas de controle de versão, programação e depuração.

### [Capítulo 4: Comandos Avançados]()
- Domine comandos avançados do Termux para acessar APIs de dispositivos, gerenciar mídias e interagir com o sistema em um nível mais profundo.

### [Capítulo 5: Comandos Mestres]()
- Aprimore suas habilidades no Termux com comandos avançados para usuários experientes e administradores de sistemas.
 

### [Capítulo 6: Comandos Avançados]()
- Libere todo o potencial do Termux com comandos para usuários avançados, incluindo utilitários de áudio, câmera e rede.

### [Capítulo 7: Comandos para Desenvolvedores]()
- Explore os comandos do Termux voltados para desenvolvedores, para codificar, testar e depurar aplicativos móveis.

### [Capítulo 8: Comandos de Administração de Sistemas]()
- Aprenda comandos essenciais de administração de sistemas para gerenciar arquivos, usuários e configurações do sistema.

### [Capítulo 9: Comandos de Administração de Redes]()
- Domine os comandos de administração de redes para monitorar, solucionar problemas e proteger conexões de rede.

### [Capítulo 10: Comandos de Gerenciamento de Dados]()
- Explore os comandos de gerenciamento de dados para manipular arquivos, diretórios e fluxos de dados.



# Chapter 1: The Termux Foundation

> This chapter covers the absolute essentials for managing the Termux environment itself, installing tools, and performing basic file system navigation. Mastering these commands is the first and most critical step.

| Command                       | Explanation                                                              |
| ----------------------------- | ------------------------------------------------------------------------ |
| `pkg update`                  | Updates the list of available packages from your subscribed repositories.  |
| `pkg upgrade`                 | Upgrades all installed packages to their latest versions.                |
| `pkg install <package>`       | Installs a specific package, like `termux-api`.                          |
| `pkg uninstall <package>`     | Removes a package from your system.                                      |
| `pkg reinstall <package>`     | Reinstalls a package, which can fix broken installations.                |
| `pkg list-installed`          | Shows a list of all packages you have installed.                         |
| `pkg search <query>`          | Searches for available packages.                                         |
| `pkg show <package>`          | Displays detailed information about a specific package.                  |
| `pkg files <package>`         | Lists all files that a specific package installed.                       |
| `termux-setup-storage`        | Prompts for permission to access the device's shared storage.            |
| `pwd`                         | Displays the full path of your current directory.                        |
| `ls`                          | Lists the files and folders in your current location.                    |
| `cd`                          | Changes your current directory (`cd ..` goes up, `cd ~` goes home).      |
| `clear`                       | Wipes the terminal screen clean.                                         |
| `exit`                        | Closes the current Termux session.                                       |
| `mkdir <name>`                | Creates a new directory.                                                 |
| `touch <filename>`            | Creates a new, empty file.                                               |
| `rm <filename>`               | Deletes a file. Use `rm -r <directory>` to delete a directory.           |
| `cp <source> <destination>`   | Copies a file or directory.                                              |
| `mv <source> <destination>`   | Moves or renames a file or directory.                                    |
| `whoami`                      | Displays the current username (e.g., `u0_a123`).                         |
| `uname -o`                    | Displays the operating system (Android).                                 |
| `df -h`                       | Shows disk space usage in a human-readable format.                       |
| `top`                         | Displays a live view of running processes and system resource usage.     |
| `ping <host>`                 | Checks network connectivity to a server (e.g., `ping google.com`).       |
| `ifconfig`                    | Displays your device's network interface information and IP address.     |

---

  


# Chapter 2: Interacting with the Android UI

> These commands, primarily from the `termux-api` package, allow your scripts to break out of the terminal and interact directly with the Android user interface, creating a bridge between the command line and the graphical environment.

| Command                                             | Explanation                                                              |
| --------------------------------------------------- | ------------------------------------------------------------------------ |
| `termux-toast "message"`                            | Shows a small, temporary pop-up message (a "toast").                     |
| `termux-dialog`                                     | Creates a pop-up dialog box to get text input from the user.               |
| `termux-dialog checkbox -v "Option1,Option2"`       | Creates a dialog with selectable checkboxes.                               |
| `termux-dialog confirm -t "Question?"`              | Creates a pop-up with "Yes" and "No" buttons.                              |
| `termux-dialog counter -r "1,10,5"`                 | Creates a dialog to select a number within a range (min, max, start).      |
| `termux-dialog date`                                | Creates a dialog with a date picker.                                     |
| `termux-dialog radio -v "Choice1,Choice2"`          | Creates a dialog with radio button options (only one can be selected).     |
| `termux-dialog sheet -v "Item1,Item2"`              | Creates a bottom sheet with selectable items.                              |
| `termux-dialog spinner -v "Value1,Value2"`          | Creates a dialog with a dropdown spinner menu.                             |
| `termux-dialog speech -t "Say something"`           | Opens a dialog to get voice input from the user.                           |
| `termux-dialog time`                                | Creates a dialog with a time picker.                                     |
| `termux-notification --title "Alert"`               | Posts a notification to the Android notification drawer.                   |
| `termux-notification-remove <id>`                   | Removes a notification that was created by Termux.                         |
| `termux-clipboard-get`                              | Prints the current content of the system clipboard.                        |
| `termux-clipboard-set "text"`                       | Sets the system clipboard to the specified text.                           |
| `termux-open <URL>`                                 | Opens a URL in the default web browser.                                    |
| `termux-open <file>`                                | Opens a file with its default Android application.                         |
| `termux-share <file>`                               | Opens the Android share dialog for a specific file.                        |
| `termux-wallpaper -f <image_file>`                  | Sets the device's home screen wallpaper from a local file.                 |
| `termux-wallpaper -u <image_url>`                   | Sets the wallpaper from an image URL.                                      |
| `termux-get-prop <property>`                        | Gets an Android system property value.                                     |
| `termux-vibrate`                                    | Vibrates the device for a short period.                                    |
| `termux-vibrate -d <milliseconds>`                  | Vibrates the device for a specified duration.                              |
| `termux-vibrate -f`                                 | Forces vibration even if the device is in silent mode.                     |
| `termux-job-scheduler`                              | Schedules a script to be run at a later time, even if Termux is closed.    |
| `logcat -d`                                         | Dumps the Android system log to the console and exits.                     |

---

  


# Chapter 3: Accessing Device Hardware

> Go beyond software and command your device's physical components. The Termux API provides direct control over the camera, flashlight, sensors, and more, turning your phone into a programmable, real-world tool.

| Command                                       | Explanation                                                              |
| --------------------------------------------- | ------------------------------------------------------------------------ |
| `termux-battery-status`                       | Returns a JSON object with battery level, temperature, and health.       |
| `termux-camera-info`                          | Returns JSON data about the available camera(s) on the device.             |
| `termux-camera-photo -c 0 image.jpg`          | Takes a photo using the specified camera (e.g., camera 0) and saves it.  |
| `termux-torch on`                             | Turns the flashlight on.                                                 |
| `termux-torch off`                            | Turns the flashlight off.                                                |
| `termux-sensor`                               | Dumps a list of all available sensors and their names.                   |
| `termux-sensor -s "accelerometer"`            | Starts streaming live data from a specific sensor.                       |
| `termux-sensor -n 1 -d 500`                   | Gets a single reading from all sensors with a delay.                     |
| `termux-sensor -c`                            | Cleans up (stops) all running sensor listeners.                          |
| `termux-tts-engines`                          | Lists the available Text-To-Speech (TTS) engines on the device.          |
| `termux-tts-speak "Hello from Termux"`        | Uses the default TTS engine to speak text aloud.                         |
| `termux-tts-speak -e <engine> "Text"`         | Speaks text using a specific TTS engine.                                 |
| `termux-tts-speak -p <pitch>`                 | Speaks text with a specified vocal pitch (e.g., `1.5` for higher).       |
| `termux-tts-speak -r <rate>`                  | Speaks text at a specified speech rate (e.g., `0.5` for slower).         |
| `termux-microphone-record`                    | Starts recording audio from the microphone.                              |
| `termux-microphone-record -f rec.wav -l 5`    | Records for 5 seconds and saves to a file.                               |
| `termux-microphone-record -q`                 | Quits the current recording.                                             |
| `termux-media-player play <file>`             | Plays a media file (audio or video).                                     |
| `termux-media-player pause`                   | Pauses the currently playing media.                                      |
| `termux-media-player stop`                    | Stops the currently playing media.                                       |
| `termux-media-player info`                    | Displays information about the currently playing media.                  |
| `termux-volume`                               | Lists all available audio streams and their volume levels.               |
| `termux-volume <stream> <level>`              | Sets the volume for a specific stream (e.g., `termux-volume music 10`).  |
| `termux-fingerprint`                          | Prompts for fingerprint authentication and returns success or failure.   |
| `termux-infrared-frequencies`                 | Gets the available infrared carrier frequencies (on supported devices).  |
| `termux-infrared-transmit -f <freq> <pattern>`| Transmits an infrared pattern.                                           |

---

  


# Chapter 4: Communication & Connectivity

> Automate and manage your device's core communication features. These API commands allow you to send SMS, initiate calls, query contacts, and control Wi-Fi connections, all from your scripts.

| Command                               | Explanation                                                              |
| ------------------------------------- | ------------------------------------------------------------------------ |
| `termux-telephony-call <number>`      | Initiates a phone call to the specified number.                          |
| `termux-telephony-cellinfo`           | Returns JSON data about neighboring cell towers.                         |
| `termux-telephony-deviceinfo`         | Returns JSON data about the device's telephony capabilities.             |
| `termux-contact-list`                 | Returns a JSON list of all contacts on the device.                       |
| `termux-sms-list`                     | Returns a JSON list of recent SMS messages.                              |
| `termux-sms-list -l 50`               | Lists the last 50 SMS messages.                                          |
| `termux-sms-send -n <number> "Msg"`   | Sends an SMS to a specific number.                                       |
| `termux-sms-send -n <num1,num2> "Hi"` | Sends an SMS to multiple numbers at once.                                |
| `termux-wifi-connectioninfo`          | Returns JSON data about the current Wi-Fi connection (SSID, IP, etc.).   |
| `termux-wifi-scaninfo`                | Returns a JSON list of nearby Wi-Fi networks.                            |
| `termux-wifi-enable true`             | Turns Wi-Fi on.                                                          |
| `termux-wifi-enable false`            | Turns Wi-Fi off.                                                         |
| `termux-location`                     | Returns JSON data with the device's last known GPS location.             |
| `termux-location -p <provider>`       | Gets location from a specific provider (`gps`, `network`, or `passive`). |
| `termux-location -r <request_type>`   | Specifies a single (`once`) or continuous (`last`) update.               |
| `termux-download <URL>`               | Downloads a file using the Android system download manager.              |
| `termux-download -t "Title" <URL>`    | Downloads a file with a custom title in the notification.                |
| `netstat`                             | Shows network connections, routing tables, and interface statistics.     |
| `ip addr`                             | A modern command to show IP addresses and network interface information. |
| `ip route`                            | Displays the current IP routing table.                                   |
| `ss`                                  | A utility to investigate sockets (a modern replacement for `netstat`).   |
| `proot`                               | Emulates `chroot`, allowing you to run programs with a different root directory. |
| `proot-distro install <alias>`        | Installs a full Linux distribution (like Ubuntu) inside Termux.          |
| `proot-distro login <alias>`          | Starts a shell inside the installed Linux distribution.                  |
| `proot-distro list`                   | Shows available and installed distributions.                             |
| `wget <URL>`                          | A non-interactive tool for downloading files from the web.               |

---

  


# Chapter 5: Process, Job, & Session Control

> Move from a casual user to a power user. Learn to manage running tasks, keep scripts alive in the background, and customize your shell session for maximum efficiency and control.

| Command                         | Explanation                                                              |
| ------------------------------- | ------------------------------------------------------------------------ |
| `ps aux`                        | Lists all running processes associated with your user with details.      |
| `kill <PID>`                    | Terminates a process gracefully using its Process ID (PID).              |
| `kill -9 <PID>`                 | Forcibly kills a stubborn or frozen process.                             |
| `pkill <process_name>`          | Kills a process based on its name instead of its PID.                    |
| `pgrep <process_name>`          | Searches for a process by name and prints its PID.                       |
| `jobs`                          | Displays tasks running in the background of your current session.        |
| `Ctrl+Z`                        | Suspends the current foreground process and moves it to the background.  |
| `bg`                            | Resumes a suspended job and keeps it running in the background.          |
| `fg %<job_number>`              | Brings a background job to the foreground, making it interactive.        |
| `command &`                     | Appending `&` to any command starts it directly in the background.       |
| `disown`                        | Detaches a background job from the current session so it won't be killed on exit. |
| `termux-wake-lock`              | Prevents the device from entering deep sleep, essential for servers.     |
| `termux-wake-unlock`            | Releases the wake lock, allowing the device to sleep normally.           |
| `termux-reload-settings`        | Applies changes from `~/.termux/termux.properties` without a restart.    |
| `termux-info`                   | Displays important diagnostic information about your Termux installation. |
| `env`                           | Prints a list of all environment variables.                              |
| `export VAR="value"`            | Sets an environment variable for the current session.                    |
| `unset VAR`                     | Deletes an environment variable.                                         |
| `alias shortcut='long command'` | Creates a custom command shortcut.                                       |
| `unalias shortcut`              | Removes a previously created alias.                                      |
| `source <file>`                 | Executes commands from a file in the current shell.                      |
| `history`                       | Displays a list of the commands you've recently used.                    |
| `uptime`                        | Shows how long the system has been running and load averages.            |
| `dmesg`                         | Prints messages from the kernel ring buffer, for hardware diagnostics.   |
| `nohup <command> &`             | Runs a command that ignores the hangup signal, keeping it alive after exit. |
| `htop`                          | Provides an interactive view of processes and resource usage (`pkg install htop`). |

---

  


# Chapter 6: Advanced File & Text Manipulation

> Unlock the true power of the shell by learning to process data. These native utilities are the cornerstone of the command line, allowing you to search, filter, and transform text and files with precision and speed.

| Command                             | Explanation                                                              |
| ----------------------------------- | ------------------------------------------------------------------------ |
| `grep <"pattern"> <file>`           | Searches for a specific pattern of text within a file.                   |
| `grep -r <"pattern"> <directory>`   | Recursively searches for a pattern in all files within a directory.      |
| `grep -i <"pattern"> <file>`        | Performs a case-insensitive search.                                      |
| `find <dir> -name "<filename>"`     | Searches for files by name within a directory hierarchy.                 |
| `find . -type f -mtime -1`          | Finds files (`-type f`) in the current directory (`.`) modified in the last day. |
| `sed 's/old/new/g' <file>`          | A stream editor that can find and replace text.                          |
| `awk '{print $1}' <file>`           | A pattern-scanning language. This prints the first word of every line.   |
| `cut -c 1-10 <file>`                | Cuts out and prints the first 10 characters of each line.                |
| `cut -d',' -f2 <file.csv>`          | Extracts the second field (`-f2`) from a CSV file using a comma delimiter. |
| `tr 'a-z' 'A-Z' < <file>`           | Translates characters. This converts a file's content to uppercase.      |
| `sort <file>`                       | Sorts the lines of a text file alphabetically.                           |
| `sort -n <file>`                    | Sorts lines numerically.                                                 |
| `uniq <file>`                       | Discards all but one of successive identical lines (use after `sort`).   |
| `wc <file>`                         | Counts the number of lines, words, and characters in a file.             |
| `diff <file1> <file2>`              | Compares two files line by line and shows the differences.               |
| `head -n 20 <file>`                 | Displays the first 20 lines of a file.                                   |
| `tail -n 20 <file>`                 | Displays the last 20 lines of a file.                                    |
| `tail -f <logfile>`                 | "Follows" a file, showing new lines as they are added in real time.      |
| `tee <filename>`                    | Reads input and writes it to both the screen and a file simultaneously.  |
| `ln -s <target> <link>`             | Creates a symbolic link (a shortcut) to a file or directory.             |
| `stat <file>`                       | Displays detailed information about a file (size, permissions, etc.).    |
| `file <file>`                       | Determines and prints the type of a file (e.g., ASCII text, JPEG image). |
| `strings <binary_file>`             | Prints the printable character sequences from a binary file.             |
| `hexdump -C <file>`                 | Displays file content in hexadecimal and ASCII format.                   |
| `base64 <file>`                     | Encodes a file to Base64 text.                                           |
| `base64 -d <file.b64>`              | Decodes a Base64 file back to its original binary form.                  |

---

  


# Chapter 7: Scripting & Automation

> Combine individual commands into powerful scripts to automate repetitive tasks. This chapter covers the essential building blocks of shell scripting, from user input and logic to controlling command execution flow.

| Command                             | Explanation                                                              |
| ----------------------------------- | ------------------------------------------------------------------------ |
| `read variable`                     | Pauses a script to wait for user input and stores it in a variable.      |
| `echo "message"`                    | Prints text to the terminal, essential for feedback in scripts.          |
| `printf "format" "text"`            | A more powerful way to print formatted text.                             |
| `sleep <seconds>`                   | Pauses the execution of a script for a specified number of seconds.      |
| `[ -f "file.txt" ]`                 | `test` expression to check for conditions, the basis of `if` statements. |
| `xargs`                             | Builds and executes commands from standard input.                        |
| `$(command)`                         | Command Substitution. Runs a command and substitutes its output.         |
| `>` (Redirect)                      | Redirects command output to a file, overwriting it.                      |
| `>>` (Append)                       | Redirects output and appends it to the end of a file.                    |
| `<` (Redirect Input)                | Uses a file as the input for a command.                                  |
| `2>` (Redirect Error)               | Redirects only the error messages (stderr) to a file.                    |
| `&>` (Redirect All)                 | Redirects both standard output and error to the same file.               |
| `&&` (AND Operator)                 | Executes the second command only if the first command succeeds.          |
| `;` (Separator)                     | Executes commands sequentially, regardless of success or failure.        |
| `basename /path/to/file.txt`        | Strips the directory path, leaving only the filename (`file.txt`).       |
| `dirname /path/to/file.txt`         | Strips the filename, leaving only the directory path (`/path/to`).       |
| `getopt`                            | Parses command-line options in scripts.                                  |
| `termux-job-scheduler -s <script>`  | Schedules a script to run periodically, even when Termux is inactive.    |
| `termux-dialog \| jq '.text'`       | A scripting pattern to get and parse user input.                         |
| `true`                              | A command that does nothing and always succeeds (exit code 0).           |
| `false`                             | A command that does nothing and always fails (exit code 1).              |
| `sh <script.sh>`                    | Executes a shell script.                                                 |
| `chmod +x <script.sh>`              | Makes a script executable, so you can run it directly with `./script.sh`.|
| `seq <start> <end>`                 | Prints a sequence of numbers, useful for `for` loops.                    |

>  `|` (Pipe)                          Connects the output of one command to the input of another.
>
>  `||` (OR Operator)                 Executes the second command only if the first command fails.                       
---

  


# Chapter 8: Storage & Archive Management

> Effectively manage files, archives, and permissions. This chapter covers essential tools for compressing and decompressing data, understanding disk usage, and controlling access to your files.

| Command                           | Explanation                                                              |
| --------------------------------- | ------------------------------------------------------------------------ |
| `chmod <permissions> <file>`      | Changes the access permissions of a file (read, write, execute).         |
| `chmod 755 <file>`                | A common permission set for executables (owner: rwx, group/others: r-x). |
| `chown <user>:<group> <file>`     | Changes the owner and group of a file (useful in proot environments).    |
| `du -h`                           | Displays disk usage of files and directories in a human-readable format. |
| `du -sh <directory>`              | Shows the total size of a single directory (`-s` for summary).           |
| `tar -czvf <archive.tar.gz> <dir>`| Creates a compressed archive (c: create, z: gzip, v: verbose, f: file).  |
| `tar -xzvf <archive.tar.gz>`      | Extracts a compressed archive (x: extract).                              |
| `tar -tvf <archive.tar.gz>`       | Lists the contents of an archive without extracting it (t: list).        |
| `gzip <file>`                     | Compresses a file, replacing it with a `.gz` version.                    |
| `gunzip <file.gz>`                | Decompresses a `.gz` file.                                               |
| `zip <archive.zip> <files>`       | Creates a `.zip` archive.                                                |
| `unzip <archive.zip>`             | Extracts files from a `.zip` archive.                                    |
| `bzip2 <file>`                    | Compresses a file using the bzip2 algorithm.                             |
| `bunzip2 <file.bz2>`              | Decompresses a `.bz2` file.                                              |
| `xz <file>`                       | Compresses a file using the xz algorithm (high compression).             |
| `unxz <file.xz>`                  | Decompresses an `.xz` file.                                              |
| `termux-storage-get <file>`       | Uses the system's file picker to copy a file into the current directory. |
| `ls -l`                           | Long listing format, shows permissions, ownership, size, and date.       |
| `ls -a`                           | Lists all files, including hidden files (starting with a dot).           |
| `ls -lh`                          | Combines long listing with human-readable file sizes.                    |
| `df -hT`                          | Shows disk space usage for filesystems, including their type (`-T`).     |
| `mount`                           | Displays all mounted filesystems.                                        |
| `readlink -f <file>`              | Follows a symbolic link to find the real path of the original file.      |
| `dd if=/dev/zero of=dummy bs=1M`  | A low-level command to create a file of a specific size for testing.     |
| `shred <file>`                    | Securely deletes a file by overwriting it multiple times.                |
| `pwd -L`                          | Prints the logical current working directory (respecting symlinks).      |

---

  


# Chapter 9: Advanced Networking & Secure Connections

> Go beyond `ping`. This chapter covers the tools for secure remote access, robust file transfers, and in-depth network diagnostics, transforming Termux into a fully-featured network administration client.

| Command                                   | Explanation                                                              |
| ----------------------------------------- | ------------------------------------------------------------------------ |
| `ssh <user@host>`                         | Secure Shell client for logging into a remote server securely.           |
| `sshd`                                    | The OpenSSH server daemon; run this to `ssh` into your Termux device.    |
| `ssh-keygen`                              | Generates a pair of cryptographic keys for passwordless SSH login.       |
| `ssh-copy-id <user@host>`                 | Copies your public key to a server to enable passwordless login.         |
| `scp <user@host:remote/file> <local>`     | Securely copies files over SSH.                                          |
| `sftp <user@host>`                        | An interactive secure file transfer program over an SSH connection.      |
| `rsync -avh <source> <dest>`              | A powerful tool for efficiently synchronizing files and directories.     |
| `curl <URL>`                              | A versatile tool to transfer data from or to a server (download, test APIs). |
| `curl -L <URL>`                           | Tells curl to follow any HTTP redirects.                                 |
| `curl -o <filename> <URL>`                | Saves the output to a specific file.                                     |
| `wget <URL>`                              | A simple, non-interactive utility for downloading files from the web.    |
| `wget -c <URL>`                           | Continues a partially downloaded file.                                   |
| `wget -r <URL>`                           | Downloads a website recursively.                                         |
| `telnet <host> <port>`                    | An unencrypted tool for testing if a network port is open.               |
| `hostname`                                | Displays the device's network hostname.                                  |
| `ip -s link`                              | Shows detailed statistics for your network interfaces (bytes, errors).   |
| `arp`                                     | Displays the system's Address Resolution Protocol (ARP) cache.           |
| `termux-contact-list \| jq`               | API pattern to get and parse data (e.g., scripting contact lookups).     |
| `termux-wifi-scaninfo \| jq`              | API pattern to get and parse info on nearby Wi-Fi networks.              |
| `ping -c 5 google.com`                    | Pings a host 5 times (`-c 5`) and then stops.                            |
| `whois <domain.com>`                      | Retrieves registration information for a domain name.                    |
| `dig <domain.com>`                        | A powerful DNS lookup utility.                                           |
| `nslookup <domain.com>`                   | Another command for querying DNS servers.                                |
| `netstat -r`                              | Displays the kernel routing table.                                       |
| `netstat -i`                              | Displays a table of all network interfaces.                              |
| `lsof -i`                                 | Lists processes that are using the network.                              |

---

  


# Chapter 10: System Internals & Diagnostics

> For the expert user. These commands let you look under the hood of the Termux environment and the underlying Android system, providing powerful tools for debugging, inspection, and advanced configuration.

| Command                | Explanation                                                              |
| ---------------------- | ------------------------------------------------------------------------ |
| `termux-chroot`        | Sets up a traditional Linux-like chroot environment.                     |
| `login`                | A command that gives you a clean login shell, often used after `termux-chroot`. |
| `id`                   | Displays user and group information.                                     |
| `getprop`              | Displays a huge list of Android system properties.                       |
| `getprop \| grep model`  | A practical example: filtering system properties to find the device model. |
| `logcat`               | Dumps a log of Android system messages, invaluable for debugging.        |
| `logcat -s "TAG"`      | Filters logcat output to show only messages with a specific tag.         |
| `ldd <binary>`         | Prints the shared library dependencies of a program.                     |
| `strace <command>`     | Traces system calls and signals, showing what a program is doing.        |
| `uname -a`             | Prints all available system information (kernel, architecture, etc.).    |
| `arch`                 | Prints the machine's architecture (e.g., `aarch64`).                     |
| `free -h`              | Displays free and used RAM in a human-readable format.                   |
| `vmstat`               | Reports information about processes, memory, paging, and CPU activity.   |
| `termux-api-start`     | A script to ensure the `termux-api` background process is running.       |
| `termux-notification-list` | Retrieves a JSON list of all active notifications posted by Termux.    |
| `pkg policy`           | Displays information about package versions and repository priorities.   |
| `pkg clean`            | Clears out the cache of downloaded package files (`.deb`).               |
| `pkg autoclean`        | Removes old, no-longer-downloadable package files from the cache.        |
| `TERM=xterm-256color`  | Sets the `TERM` variable to enable full color support in console programs. |
| `reset`                | Resets the terminal to its default state, fixing a garbled display.      |
| `stty -a`              | Displays all the settings for the current terminal.                      |
| `set -x`               | Enables debugging mode in a shell script, printing each command.         |
| `set +x`               | Disables debugging mode.                                                 |
| `hash`                 | Shows a list of cached command locations for the current shell session.  |
| `type <command>`       | Indicates how a command would be interpreted (alias, built-in, file).    |
| `bind -p`              | Lists all the keybindings and macros available in your shell.            |

---

# VERIFICAR:

### Chapter 1: Basic Commands

**pkg update**: This command updates the package lists for upgrades and installs.
   
**pkg upgrade**: Upgrades all installed packages to their latest version.
   
**pkg install [package_name]**: Installs a package. Replace `[package_name]` with the name of the package you want to install.
   
**pkg uninstall [package_name]**: Uninstalls a package. Replace `[package_name]` with the name of the package you want to uninstall.
   
**pkg search [keyword]**: Searches for packages containing the specified keyword.
   
**pkg list-all**: Lists all available packages.
   
**termux-setup-storage**: Sets up storage in Termux to access files on your device.
   
**pkg info [package_name]**: Displays information about a specific package.
   
**pkg list-installed**: Lists all installed packages.
   
**termux-wake-lock**: Keeps the device awake while Termux is running.
   
**termux-wake-unlock**: Allows the device to sleep normally.
   
**termux-open [file/path]**: Opens a file or directory with the default app.
   
**termux-open-url [URL]**: Opens the specified URL in the default browser.
   
**termux-toast [message]**: Displays a toast message on the screen.
   
**termux-volume [option]**: Adjusts the volume. Options include `music`, `ring`, `alarm`, `notification`, and `system`.

**termux-vibrate**: Vibrates the device for a specified duration.

**termux-share**: Shares files or text using the Android share menu.

**termux-clipboard-get**: Retrieves the current contents of the clipboard.

**termux-clipboard-set [text]**: Sets the clipboard contents to the specified text.

**termux-dialog**: Opens a dialog box with various options.

**termux-notification**: Sends a notification with the specified title and text.

**termux-sms-inbox**: Lists received SMS messages.

**termux-sms-send -n [number] [message]**: Sends an SMS to the specified number with the given message.

**termux-contact-list**: Lists all contacts stored on the device.

**termux-contact-get [contact_name]**: Retrieves information about the specified contact.

**termux-sms-list**: Lists all SMS messages.

**termux-tts-speak [text]**: Converts text to speech and speaks it aloud.

**termux-camera-photo [output_file]**: Takes a photo using the device's camera and saves it to the specified file.

**termux-camera-record [output_file]**: Records a video using the device's camera and saves it to the specified file.

**termux-media-player play [file]**: Plays the specified audio or video file.

**termux-media-player pause**: Pauses the currently playing media.

**termux-media-player stop**: Stops the currently playing media.

**termux-media-player seek [time]**: Seeks to the specified time in the currently playing media.

**termux-media-player playlist [file]**: Loads a playlist file.

**termux-download [URL]**: Downloads a file from the specified URL.

**termux-upload [source_file] [destination_directory]**: Uploads a file to the specified directory.

**termux-fix-shebang [file]**: Fixes the shebang of a script file to make it executable.

**termux-info**: Displays system information.

**termux-open-settings**: Opens the Termux settings menu.

**termux-wifi-enable [true/false]**: Enables or disables Wi-Fi.

**termux-battery-status**: Shows the current battery status.

**termux-telephony-cellinfo**: Shows information about the current cellular network.

**termux-telephony-deviceinfo**: Shows device-specific information.

**termux-telephony-imei**: Shows the IMEI number of the device.

**termux-telephony-signalstrength**: Shows information about the signal strength of the cellular network.

**termux-dialog**: Displays a dialog box with customizable options.

**termux-notification**: Sends a notification to the notification bar.

**termux-vibrate**: Vibrates the device.

**termux-toast**: Displays a toast message on the screen.

**termux-wifi-connectioninfo**: Shows information about the current Wi-Fi connection.

**termux-wifi-ipinfo**: Displays information about the device's IP address.

**termux-wifi-scaninfo**: Scans for Wi-Fi networks and displays information about them.

**termux-clipboard-get**: Retrieves the current contents of the clipboard.

**termux-clipboard-set [text]**: Sets the clipboard contents to the specified text.

**termux-dialog**: Displays a dialog box with customizable options.

**termux-notification**: Sends a notification to the notification bar.

**termux-vibrate**: Vibrates the device.

**termux-toast**: Displays a toast message on the screen.

**termux-battery-status**: Shows the current battery status.

**termux-camera-info**: Shows information about the device's camera(s).

**termux-camera-photo [output_file]**: Takes a photo using the device's camera and saves it to the specified file.

**termux-camera-record [output_file]**: Records a video using the device's camera and saves it to the specified file.

**termux-camera-snapshot [output_file]**: Takes a snapshot using the device's camera and saves it to the specified file.

**termux-camera-view**: Opens a live preview from the device's camera.

**termux-contact-get [contact_name]**: Retrieves information about the specified contact.

**termux-contact-list**: Lists all contacts stored on the device.

**termux-dialog**: Displays a dialog box with customizable options.

**termux-download [URL]**: Downloads a file from the specified URL.

**termux-fix-shebang [file]**: Fixes the shebang of a script file to make it executable.

**termux-info**: Displays system information.

**termux-location**: Shows the current device location.

**termux-media-player**: Controls media playback.

**termux-media-scan [path]**: Scans the specified path for media files.

**termux-microphone-record [output_file]**: Records audio using the device's microphone and saves it to the specified file.

**termux-notification**: Sends a notification to the notification bar.

**termux-open [file/path]**: Opens a file or directory with the default app.

**termux-open-url [URL]**: Opens the specified URL in the default browser.

**termux-share**: Shares files or text using the Android

 share menu.

**termux-sms-list**: Lists all SMS messages.

**termux-sms-inbox**: Lists received SMS messages.

**termux-sms-send -n [number] [message]**: Sends an SMS to the specified number with the given message.

**termux-sms-view [message_id]**: Displays the contents of the specified SMS message.

**termux-storage-get [path]**: Retrieves information about the specified storage path.

**termux-storage-list**: Lists all available storage volumes.

**termux-telephony-cellinfo**: Shows information about the current cellular network.

**termux-telephony-deviceinfo**: Shows device-specific information.

**termux-telephony-imei**: Shows the IMEI number of the device.

**termux-telephony-signalstrength**: Shows information about the signal strength of the cellular network.

**termux-torch [true/false]**: Turns the device's flashlight on or off.

**termux-tts-engines**: Lists available text-to-speech engines.

**termux-tts-speak [text]**: Converts text to speech and speaks it aloud.

**termux-upload [source_file] [destination_directory]**: Uploads a file to the specified directory.

**termux-url-opener [URL]**: Opens the specified URL in the default app.

**termux-volume**: Controls volume settings.

**termux-wallpaper [file]**: Sets the device's wallpaper to the specified image file.

**termux-wifi-connect [SSID] [password]**: Connects to the specified Wi-Fi network.

**termux-wifi-enable [true/false]**: Enables or disables Wi-Fi.

**termux-wifi-ipinfo**: Displays information about the device's IP address.

**termux-wifi-scaninfo**: Scans for Wi-Fi networks and displays information about them.

___
### Chapter 2: Intermediate Commands

**termux-am broadcast -a [action]**: Sends a broadcast intent with the specified action.

**termux-audio-info**: Displays information about the audio system.

**termux-audio-play [file]**: Plays the specified audio file.

**termux-audio-info**: Displays information about the audio system.

**termux-audio-play [file]**: Plays the specified audio file.

**termux-audio-record [output_file]**: Records audio and saves it to the specified file.

**termux-call-log**: Lists the call log.

**termux-call-log -t [type]**: Lists call log entries of the specified type (incoming, outgoing, missed).

**termux-call-log -l [limit]**: Limits the number of entries displayed in the call log.

**termux-camera-info**: Displays information about the device's camera(s).

**termux-camera-photo [output_file]**: Takes a photo using the device's camera and saves it to the specified file.

**termux-camera-record [output_file]**: Records a video using the device's camera and saves it to the specified file.

**termux-camera-snapshot [output_file]**: Takes a snapshot using the device's camera and saves it to the specified file.

**termux-camera-view**: Opens a live preview from the device's camera.

**termux-clipboard-get**: Retrieves the current contents of the clipboard.

**termux-clipboard-set [text]**: Sets the clipboard contents to the specified text.

**termux-contact-get [contact_name]**: Retrieves information about the specified contact.

**termux-contact-list**: Lists all contacts stored on the device.

**termux-dialog**: Displays a dialog box with customizable options.

**termux-download [URL]**: Downloads a file from the specified URL.

**termux-file-editor [file]**: Opens the specified file in a text editor.

**termux-file-editor-editable [file]**: Opens the specified file in an editable text editor.

**termux-fix-shebang [file]**: Fixes the shebang of a script file to make it executable.

**termux-info**: Displays system information.

**termux-infrared-frequencies**: Lists the supported frequencies of the device's infrared transmitter.

**termux-infrared-transmit [frequency] [pattern]**: Transmits an infrared pattern at the specified frequency.

**termux-keyring [options]**: Manages passwords and secrets.

**termux-media-scan [path]**: Scans the specified path for media files.

**termux-microphone-record [output_file]**: Records audio using the device's microphone and saves it to the specified file.

**termux-notification**: Sends a notification to the notification bar.

**termux-open [file/path]**: Opens a file or directory with the default app.

**termux-open-url [URL]**: Opens the specified URL in the default browser.

**termux-share**: Shares files or text using the Android share menu.

**termux-sms-list**: Lists all SMS messages.

**termux-sms-inbox**: Lists received SMS messages.

**termux-sms-send -n [number] [message]**: Sends an SMS to the specified number with the given message.

**termux-sms-view [message_id]**: Displays the contents of the specified SMS message.

**termux-telephony-cellinfo**: Shows information about the current cellular network.

**termux-telephony-deviceinfo**: Shows device-specific information.

**termux-telephony-imei**: Shows the IMEI number of the device.

**termux-telephony-signalstrength**: Shows information about the signal strength of the cellular network.

**termux-torch [true/false]**: Turns the device's flashlight on or off.

**termux-tts-engines**: Lists available text-to-speech engines.

**termux-tts-speak [text]**: Converts text to speech and speaks it aloud.

**termux-upload [source_file] [destination_directory]**: Uploads a file to the specified directory.

**termux-url-opener [URL]**: Opens the specified URL in the default app.

**termux-volume**: Controls volume settings.

**termux-wallpaper [file]**: Sets the device's wallpaper to the specified image file.

**termux-wifi-connect [SSID] [password]**: Connects to the specified Wi-Fi network.

**termux-wifi-enable [true/false]**: Enables or disables Wi-Fi.

**termux-wifi-ipinfo**: Displays information about the device's IP address.

**termux-wifi-scaninfo**: Scans for Wi-Fi networks and displays information about them.

### Chapter 3: Advanced Commands

**termux-api**: Allows access to various device APIs from Termux shell scripts.
   
**termux-battery-status**: Shows battery information such as level, status, health, etc.
   
**termux-camera-info**: Provides information about the device's camera(s).
   
**termux-call-log**: Lists call history including incoming, outgoing, and missed calls.
   
**termux-clipboard-get**: Retrieves the current contents of the clipboard.
   
**termux-clipboard-set [text]**: Sets the clipboard contents to the specified text.
   
**termux-contact-list**: Lists all contacts stored on the device.
   
**termux-dialog**: Displays a customizable dialog box.
   
**termux-download [URL]**: Downloads a file from the specified URL.
   
**termux-info**: Displays system information.
   
**termux-infrared-transmit [frequency] [pattern]**: Transmits an infrared pattern at the specified frequency.
   
**termux-job-scheduler [options]**: Schedules jobs to run in the background.
   
**termux-location**: Retrieves the device's current location.
   
**termux-media-scan [path]**: Scans the specified path for media files.
   
**termux-media-player**: Controls media playback.
   
**termux-notification**: Sends a notification to the notification bar.
   
**termux-notification-remove [id]**: Removes a notification with the specified ID.
   
**termux-notification-list**: Lists all active notifications.
   
**termux-notification-remove-all**: Removes all active notifications.
   
**termux-open [file/path]**: Opens a file or directory with the default app.
   
**termux-open-url [URL]**: Opens the specified URL in the default browser.
   
**termux-share**: Shares files or text using the Android share menu.
   
**termux-sms-inbox**: Lists received SMS messages.
   
**termux-sms-send -n [number] [message]**: Sends an SMS to the specified number with the given message.
   
**termux-sms-view [message_id]**: Displays the contents of the specified SMS message.
   
**termux-telephony-cellinfo**: Shows information about the current cellular network.
   
**termux-telephony-deviceinfo**: Shows device-specific information.
   
**termux-telephony-imei**: Shows the IMEI number of the device.
   
**termux-telephony-signalstrength**: Shows information about the signal strength of the cellular network.
   
**termux-tts-speak [text]**: Converts text to speech and speaks it aloud.
   
**termux-url-opener [URL]**: Opens the specified URL in the default app.
   
**termux-volume**: Controls volume settings.
   
**termux-wallpaper [file]**: Sets the device's wallpaper to the specified image file.
   
**termux-wifi-connect [SSID] [password]**: Connects to the specified Wi-Fi network.
   
**termux-wifi-enable [true/false]**: Enables or disables Wi-Fi.
   
**termux-wifi-ipinfo**: Displays information about the device's IP address.
   
**termux-wifi-scaninfo**: Scans for Wi-Fi networks and displays information about them.
 


### Chapter 4: Expert Commands
____

**termux-api**: Allows access to various device APIs from Termux shell scripts.
   
**termux-battery-status**: Shows battery information such as level, status, health, etc.
   
**termux-camera-info**: Provides information about the device's camera(s).
   
**termux-call-log**: Lists call history including incoming, outgoing, and missed calls.
   
**termux-clipboard-get**: Retrieves the current contents of the clipboard.
   
**termux-clipboard-set [text]**: Sets the clipboard contents to the specified text.
   
**termux-contact-list**: Lists all contacts stored on the device.
   
**termux-dialog**: Displays a customizable dialog box.
   
**termux-download [URL]**: Downloads a file from the specified URL.
   
**termux-info**: Displays system information.
   
**termux-infrared-transmit [frequency] [pattern]**: Transmits an infrared pattern at the specified frequency.
   
**termux-job-scheduler [options]**: Schedules jobs to run in the background.
   
**termux-location**: Retrieves the device's current location.
   
**termux-media-scan [path]**: Scans the specified path for media files.
   
**termux-media-player**: Controls media playback.
   
**termux-notification**: Sends a notification to the notification bar.
   
**termux-notification-remove [id]**: Removes a notification with the specified ID.
   
**termux-notification-list**: Lists all active notifications.
   
**termux-notification-remove-all**: Removes all active notifications.
   
**termux-open [file/path]**: Opens a file or directory with the default app.
   
**termux-open-url [URL]**: Opens the specified URL in the default browser.
   
**termux-share**: Shares files or text using the Android share menu.
   
**termux-sms-inbox**: Lists received SMS messages.
   
**termux-sms-send -n [number] [message]**: Sends an SMS to the specified number with the given message.
   
**termux-sms-view [message_id]**: Displays the contents of the specified SMS message.
   
**termux-telephony-cellinfo**: Shows information about the current cellular network.
   
**termux-telephony-deviceinfo**: Shows device-specific information.
   
**termux-telephony-imei**: Shows the IMEI number of the device.
   
**termux-telephony-signalstrength**: Shows information about the signal strength of the cellular network.
   
**termux-tts-speak [text]**: Converts text to speech and speaks it aloud.
   
**termux-url-opener [URL]**: Opens the specified URL in the default app.
   
**termux-volume**: Controls volume settings.
   
**termux-wallpaper [file]**: Sets the device's wallpaper to the specified image file.
   
**termux-wifi-connect [SSID] [password]**: Connects to the specified Wi-Fi network.
   
**termux-wifi-enable [true/false]**: Enables or disables Wi-Fi.
   
**termux-wifi-ipinfo**: Displays information about the device's IP address.
   
**termux-wifi-scaninfo**: Scans for Wi-Fi networks and displays information about them.


### Chapter 6: Power User Commands
____

**termux-activity-manager**: Manages activities running in the background.

**termux-app-info [package_name]**: Displays information about the specified app.

**termux-app-list**: Lists all installed apps.

**termux-audio-info**: Displays information about the audio system.

**termux-audio-play [file]**: Plays the specified audio file.

**termux-audio-record [output_file]**: Records audio and saves it to the specified file.

**termux-battery-status**: Shows battery information such as level, status, health, etc.

**termux-brightness [value]**: Sets the screen brightness to the specified value.

**termux-camera-info**: Provides information about the device's camera(s).

**termux-camera-photo [output_file]**: Takes a photo using the device's camera and saves it to the specified file.

**termux-camera-record [output_file]**: Records a video using the device's camera and saves it to the specified file.

**termux-camera-snapshot [output_file]**: Takes a snapshot using the device's camera and saves it to the specified file.

**termux-camera-view**: Opens a live preview from the device's camera.

**termux-clipboard-get**: Retrieves the current contents of the clipboard.

**termux-clipboard-set [text]**: Sets the clipboard contents to the specified text.

**termux-clipboard-clear**: Clears the clipboard contents.

**termux-contact-get [contact_name]**: Retrieves information about the specified contact.

**termux-contact-list**: Lists all contacts stored on the device.

**termux-download [URL]**: Downloads a file from the specified URL.

**termux-fix-shebang [file]**: Fixes the shebang of a script file to make it executable.

**termux-info**: Displays system information.

**termux-infrared-frequencies**: Lists the supported frequencies of the device's infrared transmitter.

**termux-infrared-transmit [frequency] [pattern]**: Transmits an infrared pattern at the specified frequency.

**termux-keyring [options]**: Manages passwords and secrets.

**termux-media-scan [path]**: Scans the specified path for media files.

**termux-microphone-record [output_file]**: Records audio using the device's microphone and saves it to the specified file.

**termux-notification**: Sends a notification to the notification bar.

**termux-notification-remove [id]**: Removes a notification with the specified ID.

**termux-notification-list**: Lists all active notifications.

**termux-notification-remove-all**: Removes all active notifications.

**termux-open [file/path]**: Opens a file or directory with the default app.

**termux-open-url [URL]**: Opens the specified URL in the default browser.

**termux-share**: Shares files or text using the Android share menu.

**termux-sms-list**: Lists all SMS messages.

**termux-sms-inbox**: Lists received SMS messages.

**termux-sms-send -n [number] [message]**: Sends an SMS to the specified number with the given message.

**termux-sms-view [message_id]**: Displays the contents of the specified SMS message.

**termux-storage-get [path]**: Retrieves information about the specified storage path.

**termux-storage-list**: Lists all available storage volumes.

**termux-telephony-cellinfo**: Shows information about the current cellular network.

**termux-telephony-deviceinfo**: Shows device-specific information.

**termux-telephony-imei**: Shows the IMEI number of the device.

**termux-telephony-signalstrength**: Shows information about the signal strength of the cellular network.

**termux-torch [true/false]**: Turns the device's flashlight on or off.

**termux-tts-engines**: Lists available text-to-speech engines.

**termux-tts-speak [text]**: Converts text to speech and speaks it aloud.

**termux-upload [source_file] [destination_directory]**: Uploads a file to the specified directory.

**termux-url-opener [URL]**: Opens the specified URL in the default app.

**termux-volume**: Controls volume settings.

**termux-wallpaper [file]**: Sets the device's wallpaper to the specified image file.
### Chapter 7: Developer Commands


**termux-api**: Allows access to various device APIs from Termux shell scripts.

**termux-clipboard-get**: Retrieves the current contents of the clipboard.

**termux-clipboard-set [text]**: Sets the clipboard contents to the specified text.

**termux-cpu-info**: Displays information about the device's CPU.

**termux-cpu-top**: Displays CPU usage by processes.

**termux-debug-info**: Displays debugging information about the Termux environment.

**termux-download [URL]**: Downloads a file from the specified URL.

**termux-fix-shebang [file]**: Fixes the shebang of a script file to make it executable.

**termux-info**: Displays system information.

**termux-job-scheduler [options]**: Schedules jobs to run in the background.

**termux-location**: Retrieves the device's current location.

**termux-media-scan [path]**: Scans the specified path for media files.

**termux-media-player**: Controls media playback.

**termux-notification**: Sends a notification to the notification bar.

**termux-notification-remove [id]**: Removes a notification with the specified ID.

**termux-notification-list**: Lists all active notifications.

**termux-notification-remove-all**: Removes all active notifications.

**termux-open [file/path]**: Opens a file or directory with the default app.

**termux-open-url [URL]**: Opens the specified URL in the default browser.

**termux-share**: Shares files or text using the Android share menu.

**termux-storage-get [path]**: Retrieves information about the specified storage path.

**termux-storage-list**: Lists all available storage volumes.

**termux-sys-info**: Displays system information.

**termux-tar**: Archives files using tar.

**termux-telephony-cellinfo**: Shows information about the current cellular network.

**termux-telephony-deviceinfo**: Shows device-specific information.

**termux-telephony-imei**: Shows the IMEI number of the device.

**termux-telephony-signalstrength**: Shows information about the signal strength of the cellular network.

**termux-torch [true/false]**: Turns the device's flashlight on or off.

**termux-tts-engines**: Lists available text-to-speech engines.

**termux-tts-speak [text]**: Converts text to speech and speaks it aloud.

**termux-upload [source_file] [destination_directory]**: Uploads a file to the specified directory.

**termux-url-opener [URL]**: Opens the specified URL in the default app.

**termux-volume**: Controls volume settings.

**termux-wallpaper [file]**: Sets the device's wallpaper to the specified image file.

**termux-wifi-connect [SSID] [password]**: Connects to the specified Wi-Fi network.

**termux-wifi-enable [true/false]**: Enables or disables Wi-Fi.

**termux-wifi-ipinfo**: Displays information about the device's IP address.

**termux-wifi-scaninfo**: Scans for Wi-Fi networks and displays information about them.

**termux-wifi-tether**: Tethers the device's Wi-Fi connection.

**termux-xdg-open [file/path]**: Opens a file or URL using the XDG standard.

**termux-contact-list**: Lists all contacts stored on the device.

**termux-contact-get [contact_name]**: Retrieves information about the specified contact.

**termux-call-log**: Lists call history including incoming, outgoing, and missed calls.

**termux-sms-list**: Lists all SMS messages.

**termux-sms-inbox**: Lists received SMS messages.

**termux-sms-send -n [number] [message]**: Sends an SMS to the specified number with the given message.

**termux-sms-view [message_id]**: Displays the contents of the specified SMS message.

**termux-camera-info**: Provides information about the device's camera(s).

**termux-camera-photo [output_file]**: Takes a photo using the device's camera and saves it to the specified file.
____
### Chapter 8: System Administration Commands


**termux-add-repo [repository]**: Adds a new repository to the list of available repositories.

**termux-chroot [directory]**: Changes the root directory for the current session.

**termux-create-package [package_name]**: Creates a new package with the specified name.

**termux-fingerprint [options]**: Manages fingerprints for SSH connections.

**termux-fix-permissions [directory/file]**: Fixes permissions for the specified directory or file.

**termux-fix-shebang [file]**: Fixes the shebang of a script file to make it executable.

**termux-info**: Displays system information.

**termux-lock-settings**: Locks Termux settings with a password.

**termux-notify**: Sends a notification to the notification bar.

**termux-open [file/path]**: Opens a file or directory with the default app.

**termux-open-url [URL]**: Opens the specified URL in the default browser.

**termux-package-info [package_name]**: Displays information about the specified package.

**termux-package-list [options]**: Lists installed packages.

**termux-reload-settings**: Reloads Termux settings from disk.

**termux-reload-style**: Reloads the Termux console style settings.

**termux-reload-fonts**: Reloads the Termux console font settings.

**termux-reload-properties**: Reloads the Termux console properties settings.

**termux-reset-settings**: Resets Termux settings to default values.

**termux-reset**: Resets Termux to a clean state.

**termux-setup-storage**: Sets up storage for Termux.

**termux-setup-storage**: Sets up storage for Termux.

**termux-share**: Shares files or text using the Android share menu.

**termux-setup-storage**: Sets up storage for Termux.

**termux-sudo**: Runs a command with superuser privileges.

**termux-telephony-configure**: Configures telephony settings.

**termux-tmpdir**: Prints the path to the temporary directory.

**termux-wallpaper [file]**: Sets the device's wallpaper to the specified image file.

**termux-wake-lock**: Keeps the device awake until explicitly released.

**termux-wake-unlock**: Releases the wake lock on the device.

**termux-wifi-connect [SSID] [password]**: Connects to the specified Wi-Fi network.

**termux-wifi-enable [true/false]**: Enables or disables Wi-Fi.

**termux-wifi-ipinfo**: Displays information about the device's IP address.

**termux-wifi-scaninfo**: Scans for Wi-Fi networks and displays information about them.

**termux-wifi-tether**: Tethers the device's Wi-Fi connection.

**termux-wifi-disable**: Disables Wi-Fi.

**termux-wifi-enable**: Enables Wi-Fi.

**termux-wifi-ipinfo**: Shows information about the Wi-Fi IP address.

**termux-wifi-scaninfo**: Scans for Wi-Fi networks and displays information.

**termux-wifi-tether**: Shares the cellular data connection via Wi-Fi.

**termux-wifi-toggle**: Toggles the Wi-Fi connection.

**termux-wifi-connect**: Connects to a specified Wi-Fi network.

**termux-wifi-connectioninfo**: Shows information about the current Wi-Fi connection.

**termux-wifi-disable**: Disables Wi-Fi.

**termux-wifi-enable**: Enables Wi-Fi.

**termux-wifi-ipinfo**: Displays information about the device's IP address.

**termux-wifi-scaninfo**: Scans for Wi-Fi networks and displays information about them.

**termux-wifi-tether**: Tethers the device's Wi-Fi connection.

**termux-wifi-toggle**: Toggles the Wi-Fi connection.

**termux-wifi-connect [SSID] [password]**: Connects to the specified Wi-Fi network.

**termux-wifi-enable [true/false]**: Enables or disables Wi-Fi.

____
### Chapter 9: Network Administration Commands


**termux-arp**: Displays and modifies the ARP cache.

**termux-cpulimit**: Limits CPU usage of a process.

**termux-df**: Displays disk usage statistics.

**termux-dns-lookup**: Performs DNS lookups.

**termux-ftp**: Initiates an FTP session.

**termux-hostname**: Displays or sets the system hostname.

**termux-iostat**: Displays I/O statistics.

**termux-ip**: Displays or configures network interfaces.

**termux-netstat**: Displays network connections, routing tables, etc.

**termux-nmap**: Performs network discovery and security auditing.

**termux-nping**: Sends ICMP echo requests to a host.

**termux-ping**: Sends ICMP echo requests to a host.

**termux-route**: Displays or modifies the IP routing table.

**termux-ss**: Displays socket statistics.

**termux-sysctl**: Configures kernel parameters at runtime.

**termux-telnet**: Initiates a Telnet session.

**termux-traceroute**: Traces the route taken by packets to a destination.

**termux-whois**: Retrieves WHOIS information for a domain.

**termux-wget**: Retrieves files from the web using HTTP, HTTPS, or FTP.

**termux-ssh**: Initiates an SSH session.

**termux-sshfs**: Mounts a remote filesystem over SSH.

**termux-tcpdump**: Captures and analyzes network packets.

**termux-ifconfig**: Displays or configures network interfaces.

**termux-ping**: Sends ICMP echo requests to a host.

**termux-route**: Displays or modifies the IP routing table.

**termux-df**: Displays disk usage statistics.

**termux-ssh**: Initiates an SSH session.

**termux-whois**: Retrieves WHOIS information for a domain.

**termux-iostat**: Displays I/O statistics.

**termux-netstat**: Displays network connections, routing tables, etc.

**termux-nmap**: Performs network discovery and security auditing.

**termux-nping**: Sends ICMP echo requests to a host.

**termux-ping**: Sends ICMP echo requests to a host.

**termux-route**: Displays or modifies the IP routing table.

**termux-ss**: Displays socket statistics.

**termux-sysctl**: Configures kernel parameters at runtime.

**termux-telnet**: Initiates a Telnet session.

**termux-traceroute**: Traces the route taken by packets to a destination.

**termux-wget**: Retrieves files from the web using HTTP, HTTPS, or FTP.

**termux-ssh**: Initiates an SSH session.

**termux-sshfs**: Mounts a remote filesystem over SSH.

**termux-tcpdump**: Captures and analyzes network packets.

**termux-ifconfig**: Displays or configures network interfaces.

**termux-ping**: Sends ICMP echo requests to a host.

**termux-route**: Displays or modifies the IP routing table.

**termux-df**: Displays disk usage statistics.

**termux-ssh**: Initiates an SSH session.

**termux-whois**: Retrieves WHOIS information for a domain.

**termux-iostat**: Displays I/O statistics.

**termux-netstat**: Displays network connections, routing tables, etc.

---

### Chapter 10: Data Management Commands
 

**termux-cat [file]**: Displays the contents of a file.

**termux-cp [source] [destination]**: Copies files and directories.

**termux-cut [options]**: Cuts out selected portions of each line of a file.

**termux-echo [text]**: Displays a line of text.

**termux-file-editor [file]**: Opens a file in the default text editor.

**termux-file-info [file]**: Displays information about a file.

**termux-head [options] [file]**: Displays the first part of a file.

**termux-less [file]**: Displays the contents of a file, one screen at a time.

**termux-ln [options] [source] [destination]**: Creates links to files.

**termux-ls [options]**: Lists directory contents.

**termux-md5sum [file]**: Calculates and verifies MD5 checksums.

**termux-mkdir [directory]**: Creates directories.

**termux-mv [source] [destination]**: Moves or renames files and directories.

**termux-od [options] [file]**: Displays the contents of a file in various formats.

**termux-paste**: Combines lines from multiple files.

**termux-pwd**: Prints the current working directory.

**termux-readlink [options] [file]**: Displays the value of a symbolic link.

**termux-realpath [file]**: Displays the absolute path of a file.

**termux-rm [options] [file]**: Removes files or directories.

**termux-sort [options]**: Sorts lines of text files.

**termux-split [options] [file]**: Splits a file into pieces.

**termux-stat [file]**: Displays file or file system status.

**termux-sum [file]**: Calculates checksums and counts the number of blocks for a file.

**termux-sync**: Synchronizes cached writes to persistent storage.

**termux-tac [file]**: Concatenates and prints files in reverse.

**termux-tail [options] [file]**: Displays the last part of a file.

**termux-touch [options] [file]**: Updates the access and modification times of files.

**termux-truncate [options] [file]**: Shrink or extend the size of a file.

**termux-uniq [options]**: Reports or omits repeated lines.

**termux-wc [options] [file]**: Prints newline, word, and byte counts for each file.

**termux-cut**: Removes sections from each line of files.

**termux-cp**: Copies files and directories.

**termux-cat**: Concatenates files and prints on the standard output.

**termux-paste**: Merges lines of files.

**termux-pwd**: Prints the name of the current working directory.

**termux-rm**: Removes files or directories.

**termux-od**: Displays files in octal format.

**termux-sort**: Sorts lines of text files.

**termux-split**: Splits a file into pieces.

**termux-stat**: Displays file or file system status.

**termux-sum**: Displays checksum and block counts for a file.

**termux-tac**: Concatenates and prints files in reverse.

**termux-tail**: Displays the last part of a file.

**termux-touch**: Updates the access and modification times of each file.

**termux-truncate**: Shrink or extend the size of each file.

**termux-uniq**: Reports or filters out repeated lines in a file.

**termux-wc**: Prints newline, word, and byte counts for each file.

**termux-which [command]**: Locates the executable file associated with a given command.

**termux-whoami**: Displays the username of the current user.

**termux-xargs [options]**: Builds and executes command lines from standard input.






