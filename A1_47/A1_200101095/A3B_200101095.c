#include <stdio.h>

int main() {
    FILE *file;
    char ch;
    char new_file[] = "changed_file.txt";

    file = fopen("./file.txt", "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return 0;
    }

    // Open new file for writing
    FILE *new_file_ptr = fopen(new_file, "w");
    if (new_file_ptr == NULL) {
        printf("Error creating new file!\n");
        return 0;
    }

    while ((ch = fgetc(file)) != EOF) {
        // Check if character is non-printable
        if (ch < 32 || ch == 127) {
            ch = '*';
        }
        fputc(ch, new_file_ptr);
    }

    fclose(file);
    fclose(new_file_ptr);

    // Read from new file and print it on console
    FILE *print_file = fopen(new_file, "r");
    if (print_file == NULL) {
        printf("Error opening new file!\n");
        return 0;
    }

    // file = fopen()
    while ((ch = fgetc(print_file)) != EOF) {
        printf("%c", ch);
    }
    fclose(print_file);
    return 0;
}
