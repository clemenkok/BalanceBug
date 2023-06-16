#ifndef UART_TO_DISTANCE_HPP_
#define UART_TO_DISTANCE_HPP_

void uartToDistanceSetup();
long getBoxHeightInPixels(byte (&myBuffer)[12]);
long getPixelCenterX(byte (&myBuffer)[12]);
int convertDistanceCm(long bb_pixel_height);
bool takeReading(long pixel_center_x, long pixel_box_height);
void uartToDistanceLoop();

#endif