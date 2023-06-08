#include <HLS/hls.h>
#include "rgb_to_hsv.h"
#include <stdio.h>
#include <stdint.h>


int main(void){
    uint8_t red;
    uint8_t blue;
    uint8_t green;
    
    red = 255;
    green = 245;
    blue = 10;
    long long result = rgb_to_hsv(red, green, blue, 1);
    printf("%lld\n" ,result);
    /*
    red = 50;
    green = 100;
    blue = 150;
    result = rgb_to_hv(red, green, blue);
    printf("%lld\n" ,result);

    red = 25;
    green = 45;
    blue = 0;
    result = rgb_to_hv(red, green, blue);
    printf("%lld\n" ,result);
    */
    /*
    red = 50;
    green = 100;
    blue = 150;
    long long h = rgb_to_h(red, green, blue);
    printf("%lld\n" ,h);
    long long s = rgb_to_s(red, green, blue);
    printf("%lld\n" ,s);
    long long v = rgb_to_v(red, green, blue);
    printf("%lld\n" ,v);
    */
    return 0;
}