import numpy as np
from PIL import Image

width, height = 1920, 1080

f_red = open('rolls_red_channel_out.txt','r')
f_blue = open('rolls_blue_channel_out.txt','r')
f_green = open('rolls_green_channel_out.txt','r')

image = []

for i in range(height):
    row = []
    for j in range(width):
        red_hex = f_red.readline().strip()
        blue_hex = f_blue.readline().strip()
        green_hex = f_green.readline().strip()
        '''
        if red_hex =="xx":
            red_hex = "00"
        if blue_hex =="xx":
            blue_hex = "00"
        if green_hex =="xx":
            green_hex = "00"
        '''
        red_int = int(red_hex, 16)
        blue_int = int(blue_hex, 16)
        green_int = int(green_hex, 16)
        row.append([red_int, green_int, blue_int])
        #print(pixels)
    image.append(row)

image = np.array(image)

im = Image.fromarray(np.uint8(image))
im = im.save("new1.jpg")
'''
returned_image = open('returned_image.jpg', 'wb')
returned_image.write(data)
f_red.close()
f_green.close()
f_blue.close()
returned_image.close()
print("write end")
'''