#include "SR04.h"

#include <stdio.h>

int main(int argc, char *argv[]) {
    SR04 sr04(23, 24);
    while (1) {
        float distance = sr04.get_distance();
        printf("distance: %f cm\n", distance);
    }
    return 0;
}
