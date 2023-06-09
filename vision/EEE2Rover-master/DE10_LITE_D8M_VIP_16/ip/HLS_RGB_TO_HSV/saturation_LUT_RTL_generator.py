width = 8
r_width = width
g_width = width
b_width = width

sat_threshold = 0.7 #meaning we want sat above 70% to return s = 1

print("module SATURATION(r, g, b, s);")
print("    input [{}:0] r;".format(r_width - 1))
print("    input [{}:0] g;".format(g_width - 1))
print("    input [{}:0] b;".format(b_width - 1))
print("    output wire s;")
print()
print("    wire [{}:0] max;".format(width - 1))
print("    wire [{}:0] min;".format(width - 1))
print("    wire [{}:0] min_threshold;".format(width - 1))
print()
print("    always @(*) begin")
print("        if (red >= green & red >= blue) max = red;")
print("        if (green >= red & green >= blue) max = green;")
print("        if (blue >= green & blue >= red) max = blue;")
print("        if (red <= green & red <= blue) min = red;")
print("        if (green <= red & green <= blue) min = green;")
print("        if (blue <= green & blue <= red) min = blue;")
print("    end")
print()
print("    always @(*) begin")
print("        case (max)")
for i in range(256):
    print("            {}: min_threshold = {};".format(i ,int((1-sat_threshold)*i) ))
print("            default: min_threshold = 0;")
print("        endcase")
print("    end")
print()
print()
print("        assign s = (min < min_threshold);")
print("endmodule")