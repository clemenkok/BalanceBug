#include <HLS/hls.h>
#include <HLS/ac_int.h>

#ifndef RGBTOHSV_H
#define RGBTOHSV_H

component ac_int<28, false> rgb_to_hsv(
    ac_int<8, false> red, ac_int<8, false> green, ac_int<8, false> blue, ac_int<1, false> s
);

#endif