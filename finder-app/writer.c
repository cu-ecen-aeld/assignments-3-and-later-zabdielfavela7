#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>


int main(int argc, char *argv[]) {

    openlog(NULL, 0, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Invalid number of arguments: %d", argc);
        return 1;
    }

    char *filepath = argv[1];
    char *text = argv[2];

    syslog(LOG_DEBUG, "Writing %s to %s", text, filepath);

    
    FILE *file = fopen(filepath, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: couldn't open file %s", filepath);
        return 1;
    }

    if (fprintf(file, "%s", text) < 0) {
        syslog(LOG_ERR, "Error: couldn't write text to file");
        fclose(file);
        return 1;
    }

    fclose(file);

    syslog(LOG_DEBUG, "Success: writing to file %s", filepath);
    // 
    return 0;
}
