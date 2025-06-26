# tail Cheat Sheet | tail Command Line Guide

# tail Cheat Sheet - tail Command Line Guide

The `tail` command in Linux is used to display the last few lines of a file or stream of data. By default, it shows the last 10 lines of a file, but this can be customized to show any number of lines or even specific bytes. It is commonly used for monitoring log files in real-time.

### **Commonly Used Parameters and Their Meanings**

1.  **`tail file.txt`**
    -   **Description**: Displays the last 10 lines of `file.txt`.
    -   **Usage**: Basic use of the `tail` command to view the end of a file.
    -   _Output_:  
        _Last 10 lines of file.txt_
2.  **`tail -n 20 file.txt`**
    -   **Description**: Displays the last 20 lines of `file.txt`.
    -   **Usage**: Customize the number of lines to display from the end of the file.
    -   _Output_:  
        _Last 20 lines of file.txt_
3.  **`tail -c 50 file.txt`**
    -   **Description**: Displays the last 50 bytes of `file.txt`.
    -   **Usage**: Useful for viewing a specific number of bytes from the end of a file.
    -   _Output_:  
        _Last 50 bytes of file.txt_
4.  **`tail -f file.txt`**
    -   **Description**: Displays the last 10 lines of `file.txt` and keeps updating the output as new lines are added.
    -   **Usage**: Useful for monitoring log files in real-time.
    -   _Output_:  
        _New lines will be added to the output as they are written to the file._
5.  **`tail -n +5 file.txt`**
    -   **Description**: Displays all lines starting from line 5 until the end of the file.
    -   **Usage**: Useful when you want to skip the first few lines and view the rest.
    -   _Output_:  
        _Lines from the 5th line to the end of file.txt_
6.  **`tail -F file.txt`**
    -   **Description**: Similar to `-f`, but will also track the file if it is rotated (e.g., a log file that is deleted and replaced).
    -   **Usage**: Ideal for monitoring log files that are periodically rotated.
    -   _Output_:  
        _Continuously tracks new lines even after the file is rotated._

---

### **`tail` Command Cheat Sheet**

**Option**

**Description**

**Example**

`tail file.txt`

Displays the last 10 lines of a file

`tail file.txt`

`-n [number]`

Displays the last specified number of lines

`tail -n 20 file.txt`

`-c [number]`

Displays the last specified number of bytes

`tail -c 50 file.txt`

`-f`

Follows the file in real-time, displaying new lines as they are added

`tail -f file.txt`

`-n +[number]`

Starts displaying lines from the specified line number

`tail -n +5 file.txt`

`-F`

Follows the file in real-time, handling file rotation

`tail -F file.txt`

---

### **Conclusion**

The `tail` command is an essential tool for viewing the end of files, especially large files like logs. Its real-time monitoring capabilities with the `-f` option make it indispensable for tracking updates as they happen. With the ability to customize the number of lines or bytes displayed and follow files even after they are rotated, `tail` is highly versatile for file monitoring and system administration. Mastering the `tail` command allows users to efficiently handle large data streams and logs in Linux environments.

## [Linux Commands Cheat Sheet With Examples \[Best List\]](https://www.commandinline.com/linux/linux-commands-cheat-sheet-with-examples-best-list/)

March 13, 2025October 13, 2024 by [cil](https://www.commandinline.com/author/cil/ "View all posts by cil")

[![linux-commands-cheat-sheet-with-examples](https://www.commandinline.com/wp-content/uploads/2024/10/linux-commands-cheat-sheet-with-examples.jpg)](https://www.commandinline.com/linux/linux-commands-cheat-sheet-with-examples-best-list/)

Linux lets you quickly, effectively, and in your own special way complete chores. It is no more just an operating system. Learning Linux commands will transform how you run your computer regardless of your level of tech knowledge—system administrator, developer, or just enthusiast. Linux commands provide users the most flexible and efficient means of handling … [Read more](https://www.commandinline.com/linux/linux-commands-cheat-sheet-with-examples-best-list/ "Linux Commands Cheat Sheet With Examples [Best List]")

## [Common Linux Text Processing Commands](https://www.commandinline.com/linux/common-linux-text-processing-commands/)

March 15, 2025October 13, 2024 by [cil](https://www.commandinline.com/author/cil/ "View all posts by cil")

[![](https://www.commandinline.com/wp-content/uploads/2024/10/linux-text-processing-commands.jpg)](https://www.commandinline.com/linux/common-linux-text-processing-commands/)

Linux provides a variety of powerful text processing commands that allow users to manipulate, filter, search, and format text files. These commands are essential for dealing with logs, configuration files, and text data. Here’s a detailed explanation of Common Linux Text Processing Commands: 1. cat — Concatenate and Display Files The cat command is used … [Read more](https://www.commandinline.com/linux/common-linux-text-processing-commands/ "Common Linux Text Processing Commands")
