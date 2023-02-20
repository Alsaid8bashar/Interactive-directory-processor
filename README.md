# Interactive-directory-processor
This is a Bash script that performs three different operations on a specified directory.
1-Delete: The script takes a directory and a maximum file size as input and deletes all files in the directory and its subdirectories that exceed the specified size.

2-Analytics: The script takes a directory and a regular expression as input and searches for files in the directory and its subdirectories that match the regular expression. It then counts the total number of matches found.

3-Arrange: The script takes a directory, a new directory name, and a file type as input. It searches for all files in the specified directory and its subdirectories that match the specified file type and moves them to the new directory.

To use the script, the user needs to provide a valid directory name as input, and then select one of the three available operations by typing in "del", "anly", or "arr". For each operation, the script prompts the user for additional input as needed.

Note that the script is recursive, meaning it will perform the specified operation on all files and subdirectories in the specified directory. Therefore, use it with caution and make sure you understand what it does before running it.

To run the script, simply save it as a .sh file and execute it in a terminal using the command "bash <filename>.sh".
