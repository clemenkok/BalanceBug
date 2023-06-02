from PIL import Image

#img = Image.open('small_rolls.jpg')
img = Image.open('dimmer_beacons.jpg')
pixels = img.load() 
width, height = img.size

print(width, height)

# write the red, green, and blue channels into different files
f_red = open('dimmer_red_channel.txt','w')
f_blue = open('dimmer_blue_channel.txt','w')
f_green = open('dimmer_green_channel.txt','w')

for y in range(height):      # this row
    for x in range(width):   # and this row was exchanged
        r, g, b = pixels[x, y]

        f_red.write(f"{r:02x}\n")
        f_green.write(f"{g:02x}\n")
        f_blue.write(f"{b:02x}\n")

        
        # in case your image has an alpha channel
        # r, g, b, a = pixels[x, y]

        #print(x, y, f"#{r:02x}{g:02x}{b:02x}")
print('write end')
f_red.close()
f_blue.close()
f_green.close()