#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char *argv[]) {
    // Open syslog with LOG_USER facility
    openlog(NULL, 0, LOG_USER);

    // Check if correct number of arguments are provided
    if (argc != 3) {
        syslog(LOG_ERR, "Error: Invalid number of arguments. Usage: %s <file_path> <string_to_write>", argv[0]);
        closelog();
        return 1;
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Open file for writing
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Could not open file %s", writefile);
        closelog();
        return 1;
    }

    // Write string to file
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
    int result = fputs(writestr, file);
    if (result == EOF) {
        syslog(LOG_ERR, "Error: Could not write to file %s", writefile);
        fclose(file);
        closelog();
        return 1;
    }

    // Close file
    fclose(file);
    closelog();
    return 0;
}
