#include <HLS/hls.h>
#include <HLS/ac_int.h>
#include <stdio.h>
#include <stdint.h>

// 32 bits for H
// 24 bits of H, 16 bits for S, 8 bits for V

/*
component hls_always_run_component ac_int<56, false> rgb_to_hsv(
    ac_int<8, false> red, ac_int<8, false> green, ac_int<8, false> blue
){
    
    // do the conversion
    uint8_t min, max, mid;
    
    if (red > green && red > blue){
        max = red;
        if (green > blue){
            mid = green;
            min = blue;
        }
        else{
            mid = blue;
            min = green;
        }
    }
    if (green > red && green > blue){
        max = green;
        if (red > blue){
            mid = red;
            min = blue;
        }
        else{
            mid = blue;
            min = red;
        }
    }
    if (blue > red && blue > green){
        max = blue;
        if (red > green){
            mid = red;
            min = green;
        }
        else{
            mid = green;
            min = red;
        }
    }
    
    ac_int<19, false> h = 0;
    ac_int<16, false> s = 0;
    ac_int<8, false> v = 0;
    v = max;

    if (max-min == 0){
        s = 0;
        h = 0;

        ac_int<43, false> result;
        result.set_slc(0, v);
        result.set_slc(8, s);
        result.set_slc(24, h);

        return result;
    }

    uint8_t i;
    if (max == red && min == blue) i = 0;
    else if (max == green && min == blue) i = 1;
    else if (max == green && min == red) i = 2;
    else if (max == blue && min == red) i = 3;
    else if (max == blue && min == green) i = 4;
    else if (max == red && min == green) i = 5;
    
    uint32_t delta = max-min;
    s = ((delta << 16) -1)/max;

    uint32_t delta_mid_min = mid-min;
    
    ac_int<17, false> f = 0;
    f = (delta_mid_min << 16)/delta +1;
    if (i == 1 || i == 3 || i == 5){
        f = 65537 - f;
    }
    h = 65537*i + f;

    ac_int<43, false> result;
    result.set_slc(0, v);
    result.set_slc(8, s);
    result.set_slc(24, h);

    return result;
}
*/
/*
component hls_always_run_component ac_int<56, false> rgb_to_h(
    ac_int<8, false> red, ac_int<8, false> green, ac_int<8, false> blue
){
    
    // do the conversion
    uint8_t min, max, mid;
    
    if (red > green && red > blue){
        max = red;
        if (green > blue){
            mid = green;
            min = blue;
        }
        else{
            mid = blue;
            min = green;
        }
    }
    if (green > red && green > blue){
        max = green;
        if (red > blue){
            mid = red;
            min = blue;
        }
        else{
            mid = blue;
            min = red;
        }
    }
    if (blue > red && blue > green){
        max = blue;
        if (red > green){
            mid = red;
            min = green;
        }
        else{
            mid = green;
            min = red;
        }
    }

    ac_int<19, false> h = 0;

    if (max-min == 0){
        // return h as some invalid value
        
        h = 524287; //this value will never be reached normally

        return h;
    }

    uint8_t i;
    if (max == red && min == blue) i = 0;
    else if (max == green && min == blue) i = 1;
    else if (max == green && min == red) i = 2;
    else if (max == blue && min == red) i = 3;
    else if (max == blue && min == green) i = 4;
    else if (max == red && min == green) i = 5;

    uint32_t delta_mid_min = mid-min;
    
    ac_int<17, false> f = 0;
    f = (delta_mid_min << 16)/(max-min) +1;
    if (i == 1 || i == 3 || i == 5){
        f = 65537 - f;
    }
    h = 65537*i + f;

    return h;
}

component hls_always_run_component ac_int<56, false> rgb_to_s(
    ac_int<8, false> red, ac_int<8, false> green, ac_int<8, false> blue
){
    
    // do the conversion
    uint8_t min, max, mid;
    
    if (red > green && red > blue){
        max = red;
        if (green > blue){
            mid = green;
            min = blue;
        }
        else{
            mid = blue;
            min = green;
        }
    }
    if (green > red && green > blue){
        max = green;
        if (red > blue){
            mid = red;
            min = blue;
        }
        else{
            mid = blue;
            min = red;
        }
    }
    if (blue > red && blue > green){
        max = blue;
        if (red > green){
            mid = red;
            min = green;
        }
        else{
            mid = green;
            min = red;
        }
    }

    ac_int<16, false> s = 0;
    
    if (max-min == 0){
        s = 0;
        return s;
    }

    uint32_t delta = max-min;
    s = ((delta << 16) -1)/max;

    return s;
}

component hls_always_run_component ac_int<56, false> rgb_to_v(
    ac_int<8, false> red, ac_int<8, false> green, ac_int<8, false> blue
){
    
    // do the conversion
    uint8_t min, max, mid;
    
    if (red > green && red > blue){
        max = red;
        if (green > blue){
            mid = green;
            min = blue;
        }
        else{
            mid = blue;
            min = green;
        }
    }
    if (green > red && green > blue){
        max = green;
        if (red > blue){
            mid = red;
            min = blue;
        }
        else{
            mid = blue;
            min = red;
        }
    }
    if (blue > red && blue > green){
        max = blue;
        if (red > green){
            mid = red;
            min = green;
        }
        else{
            mid = green;
            min = red;
        }
    }
    
    ac_int<8, false> v = 0;
    v = max;
    return v;
}
*/

component hls_always_run_component ac_int<25, false> rgb_to_hsv(
    ac_int<8, false> red, ac_int<8, false> green, ac_int<8, false> blue
){
    
    // do the conversion
    uint8_t min, max, mid;
    int16_t sred = red;
    int16_t sgreen = green;
    int16_t sblue = blue;
    
    if (red > green && red > blue){
        max = red;
        if (green > blue){
            mid = green;
            min = blue;
        }
        else{
            mid = blue;
            min = green;
        }
    }
    if (green > red && green > blue){
        max = green;
        if (red > blue){
            mid = red;
            min = blue;
        }
        else{
            mid = blue;
            min = red;
        }
    }
    if (blue > red && blue > green){
        max = blue;
        if (red > green){
            mid = red;
            min = green;
        }
        else{
            mid = green;
            min = red;
        }
    }
    
    ac_int<9, false> h = 0;
    ac_int<8, false> s = 0;
    ac_int<8, false> v = 0;
    v = max;
    float delta = max - min;

    if (v == 0){
        s = 0;
        h = 0;

        ac_int<25, false> result;
        result.set_slc(0, v);
        result.set_slc(8, s);
        result.set_slc(16, h);

        return result;
    }

    if (max == red){
        h = 60 * ((int)((sgreen-sblue)/delta) % 6);
    }
    else if (max == green){
        h = 60 * ((sblue - sred)/delta +2);
    }
    else if (max == blue){
        h = 60 * ((sred - sgreen)/delta +4);
    }

    s = delta*100/max;

    ac_int<25, false> result;
    result.set_slc(0, v);
    result.set_slc(8, s);
    result.set_slc(16, h);

    return result;
}