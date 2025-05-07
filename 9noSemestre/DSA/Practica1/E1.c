#include <stdio.h>
#include <string.h>

// Function to process the input string and return a modified string
void processString(const char *input, char *output) {
    int i = 0;
    while (input[i] != '\0') {
        // Example: Convert to uppercase
        if (input[i] >= 'a' && input[i] <= 'z') {
            output[i] = input[i] - 32;
        } else {
            output[i] = input[i];
        }
        i++;
    }
    output[i] = '\0'; // Null-terminate the output string
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <string>\n", argv[0]);
        return 1;
    }

    char output[100]; // Buffer for the modified string
    processString(argv[1], output);

    printf("Original String: %s\n", argv[1]);
    printf("Modified String: %s\n", output);

    return 0;
}