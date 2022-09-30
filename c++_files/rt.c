#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char** argv)
{
    if (argc <2)
    {
        fprintf(stderr, "Usage : rt <command>\n");
        return 1;
    }

    if (setuid(0) || setgid(0))
    {
        perror("Error while setuid/setgid");
        return 2;
    }

    execvp(argv[1], argv+1);

    perror(argv[1]);
    return 3;
}
