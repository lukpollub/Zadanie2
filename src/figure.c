#include <stdio.h>
#include <stdlib.h>
#include "lib_area.h"
#include "lib_volume.h"

float main() {
    float a, b, h;
    int figure;
    printf("Podaj rodzaj figury: ");
    scanf("%d", &figure);
    printf("Wprowadz wymiary a, b, h:");
    scanf("%f %f %f", &a, &b, &h);
    if (figure == 1){
        printf("Prostokat\n");
        printf("Pole: %.2f\n", prostokatP(a,b));
        printf("Objetosc nie istnieje\n");
    }else if (figure == 2){
        printf("prostopadloscian:\n");
        printf("Pole: %.2f\n", prostpadloscianP(a,b,h));
        printf("Objetosc: %.2f\n", prostpadloscianV(a,b,h));
    }

    return 0;
}
