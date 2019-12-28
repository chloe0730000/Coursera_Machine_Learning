# Linux For Developer

--------------------------
* [Configuration](#Configuration)
* [Course 1](#Course_1)
* [Course 2](#Course_2)
* [Course 3](#Course_3)
* [Course 4](#Course_4)





--------------------------

## Configuration
* Use paralle to install CentOS 7
* run [ready-for.sh](https://github.com/chloe0730000/Coursera/blob/master/Linux%20for%20Developers/env/ready-for.sh) in CentOS7 -> bash ready-for.sh; bash ready-for.sh --install LFD301
* not using KDE; using gnome




## Course_1

1. install KDE (optional): sudo yum groupinstall KDE

2. Get the manual guide
	* man znew
		* To narrow the list down to pages that are an exact match: man -f znew -> equal whatis znew
		* Get the page from chapter two: man 2 stat
		* See all pages: man -a stat
	* Web 
		* gnome-help (on GNOME desktop); kdehelpcenter (on KDE)
	* info ls
	* rm --help; help pwd




## Course_2

1. edit text file: **vi** and **emacs**; **gedit** for GNOME; **KWrite** for KDE

	* vi (appear in every linux system)
		* GNOME offers a graphical interface know as **gvim** ; KED offers **kvim**
		* create a file and add line (Method1)
			* echo line 1 > create_new_file.txt  -> create new file with line 1 as first line
			* echo line 2 >> create_new_file.txt  -> add new line
		* create a file and add line (Method2)
			* echo -e 'line one\nline two\nline three ' > file_name.txt
		* create a file and add line (Method3)
			* cat<<EOF>file_name.txt <br/>
				1 <br/>
				2 <br/>
				3 <br/>
				EOF
		* edit file 
			* vi create_new_file.txt -> edit the file directly through command line
			* gedit create_new_file.txt -> directly the file through opening the file

2. Arithmetic Expression Evaluation Forms
	* x=3
		* echo $((x+1)) -> 4 (more efficient)
		* echo $(($x+1)) -> 4
		* echo (expr $x+1) -> 3+1
		* echo (expr $x + 1) -> 4

3. Examining hard disk partitions
	* sudo /sbin/fdisk -l
	* The **gparted** utility (and some equivalents) let you do all these operations in a graphical user-friendly manner

4. Write a program and execute it
	* cd /tmp
		* echo echo Hello, This is my ls program > ls -> program name called ls under tmp folders
		* to execute it -> bash ./ls



## Course_3

1. Memory

   * Check CPU usage on linus: Applications -> System tools -> system monitor

   * Check current memory usage: free -m
   * Detail look on memory usage: cat /proc/meminfo

   

## Course_4

1. File transfer tools
   * graphical: FileZilla
   * linux built-in: vsftpd