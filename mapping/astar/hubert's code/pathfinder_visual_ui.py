import tkinter as tk
GRIDHEIGHT = 15
GRIDWIDTH = GRIDHEIGHT
grid = [] #2d array of [y][x]
vertices = []
plot_exploration_job = None
is_setting_start = False
is_setting_dest = False
start = [0,0]
destination = [0,0]

def create_grid(event=None):
    # plot grid lines and add to grid array
    global grid
    w = c.winfo_width() # Get current width of canvas
    h = c.winfo_height() # Get current height of canvas
    c.delete('all')

    # Creates all vertical lines
    for i in range(0, w, GRIDWIDTH):
        c.create_line([(i, 0), (i, h)], tag='grid_line', fill='#E5E4E2')

    # Creates all horizontal lines
    for i in range(0, h, GRIDHEIGHT):
        c.create_line([(0, i), (w, i)], tag='grid_line', fill='#E5E4E2')
    
    for i in range(0, h-GRIDHEIGHT, GRIDHEIGHT):
        grid.append([0 for _ in range(0, w-GRIDWIDTH, GRIDWIDTH)])

def shade(event):
    # shade grid when left clicked
    if not is_setting_start and not is_setting_dest:
        global grid
        x = event.x
        y = event.y
        grid_x = x // GRIDWIDTH * GRIDWIDTH
        grid_y = y // GRIDHEIGHT * GRIDHEIGHT
        for i in range(grid_x, grid_x + GRIDWIDTH):
            c.create_line([(i, grid_y), (i, grid_y + GRIDHEIGHT)], fill="#A0A0A0")
        c.create_line([(grid_x, grid_y), (grid_x, grid_y + GRIDHEIGHT)], tag='grid_line', fill='#E5E4E2')
        c.create_line([(grid_x + GRIDWIDTH, grid_y), (grid_x + GRIDWIDTH, grid_y + GRIDHEIGHT)], tag='grid_line', fill='#E5E4E2')
        c.create_line([(grid_x, grid_y), (grid_x + GRIDWIDTH, grid_y)], tag='grid_line', fill='#E5E4E2')
        c.create_line([(grid_x, grid_y + GRIDHEIGHT), (grid_x + GRIDWIDTH, grid_y + GRIDHEIGHT)], tag='grid_line', fill='#E5E4E2')
        grid[y // GRIDHEIGHT][x // GRIDWIDTH] = 1

def unshade(event):
    # unshade grid when right clicked
    if not is_setting_start and not is_setting_dest:
        global grid
        x = event.x
        y = event.y
        grid_x = x // GRIDWIDTH * GRIDWIDTH
        grid_y = y // GRIDHEIGHT * GRIDHEIGHT
        for i in range(grid_x, grid_x + GRIDWIDTH):
            c.create_line([(i, grid_y), (i, grid_y + GRIDHEIGHT)], fill="#FFFFFF")
        c.create_line([(grid_x, grid_y), (grid_x, grid_y + GRIDHEIGHT)], tag='grid_line', fill='#E5E4E2')
        c.create_line([(grid_x + GRIDWIDTH, grid_y), (grid_x + GRIDWIDTH, grid_y + GRIDHEIGHT)], tag='grid_line', fill='#E5E4E2')
        c.create_line([(grid_x, grid_y), (grid_x + GRIDWIDTH, grid_y)], tag='grid_line', fill='#E5E4E2')
        c.create_line([(grid_x, grid_y + GRIDHEIGHT), (grid_x + GRIDWIDTH, grid_y + GRIDHEIGHT)], tag='grid_line', fill='#E5E4E2')
        grid[y // GRIDHEIGHT][x // GRIDWIDTH] = 0

def set_point(event):
    # set start and destination point on right click
    x_unit = (event.x + GRIDWIDTH//2) // GRIDWIDTH * GRIDWIDTH
    y_unit = (event.y + GRIDHEIGHT//2) // GRIDHEIGHT * GRIDHEIGHT
    if is_setting_start:
        global start
        c.delete('start_point')
        hover_color = 'blue'
        c.create_line([(x_unit-4, y_unit-4), (x_unit+4, y_unit+4)], tag='start_point', fill=hover_color)
        c.create_line([(x_unit-4, y_unit+3), (x_unit+4, y_unit-5)], tag='start_point', fill=hover_color)
        start = [event.x // GRIDWIDTH, event.y // GRIDHEIGHT]
    elif is_setting_dest:
        global destination
        c.delete('dest_point')
        hover_color = 'black'
        c.create_line([(x_unit-4, y_unit-4), (x_unit+4, y_unit+4)], tag='dest_point', fill=hover_color)
        c.create_line([(x_unit-4, y_unit+3), (x_unit+4, y_unit-5)], tag='dest_point', fill=hover_color)
        destination = [event.x // GRIDWIDTH, event.y // GRIDHEIGHT]
    if is_setting_start or is_setting_dest:
        c.delete('hover_point')

def vertex_borders_wall(vertex):
    # returns true if the vertex is bordering a wall
    global grid
    for x in [vertex[0]-1, vertex[0]]:
        for y in [vertex[1]-1, vertex[1]]:
            if grid[y][x] == 1:
                return True
    return False

def create_vertices():
    # create list of all valid vertices
    # vertices are valid if they do not border any wall
    global vertices
    vertices = []
    w = c.winfo_width() # Get current width of canvas
    h = c.winfo_height() # Get current height of canvas
    for i in range(0, w//GRIDWIDTH):
        for j in range(0, h//GRIDHEIGHT):
            if not vertex_borders_wall([i, j]):
                vertices.append([i, j])

def plot_point(vertex, color):
    # helper function to draw a waypoint on the UI
    global vertices
    x = vertex[0] * GRIDWIDTH
    y = vertex[1] * GRIDHEIGHT
    c.create_oval(x-2, y-2, x+2, y+2, width = 0, fill = color, tags="waypoints")

def is_neighbour(vertex1, vertex2):
    # check if vertex is neighbour of other vertex
    if (vertex1[0]-1 <= vertex2[0] <= vertex1[0]+1) and (vertex1[1]-1 <= vertex2[1] <= vertex1[1]+1):
        if (vertex1[0] != vertex2[0]) or (vertex1[1] != vertex2[1]):
            return True
    return False

def direct_distance(vertex1, vertex2):
    # pythagoras theorem
    return ((vertex1[0]-vertex2[0])**2 + (vertex1[1]-vertex2[1])**2) **(1/2)

def plot_exploration(visited_order, i, prev, period):
    global vertices
    global destination
    global plot_exploration_job

    if i < len(visited_order):
        plot_point(vertices[visited_order[i]], "green")
        plot_exploration_job =  root.after(period, plot_exploration, visited_order, i+1, prev, period)
    else:
        print("Plotting Waypoints...")
        pointer = vertices.index(destination)
        while pointer != None:
            plot_point(vertices[pointer], "red")
            pointer = prev[pointer]    
        print("Plotting Done")

def plot_movement(cameFrom):
    def plot_movement_helper(cameFrom, pointer):
        # recursive backtracking
        global plot_movement_job
        if pointer != None:
            plot_movement_job = root.after(100, plot_movement_helper, cameFrom, cameFrom[pointer])
            plot_point(vertices[pointer], "blue")

    plot_movement_helper(cameFrom, vertices.index(destination))

def mouse_motion(event):
    if is_setting_start:
        hover_color = 'blue'
    elif is_setting_dest:
        hover_color = 'black'
    if is_setting_start or is_setting_dest:
        c.delete('hover_point')
        x_unit = (event.x + GRIDWIDTH//2) // GRIDWIDTH * GRIDWIDTH
        y_unit = (event.y + GRIDHEIGHT//2) // GRIDHEIGHT * GRIDHEIGHT
        c.create_line([(x_unit-4, y_unit-4), (x_unit+4, y_unit+4)], tag='hover_point', fill=hover_color)
        c.create_line([(x_unit-4, y_unit+3), (x_unit+4, y_unit-5)], tag='hover_point', fill=hover_color)

def toggle_start(event=None):
    global is_setting_start
    global is_setting_dest
    if (is_setting_start):
        c.delete('hover_point')
    is_setting_start = not is_setting_start
    is_setting_dest = False

def toggle_destination(event=None):
    global is_setting_start
    global is_setting_dest
    if (is_setting_dest):
        c.delete('hover_point')
    is_setting_dest = not is_setting_dest
    is_setting_start = False
    
### DEBUG FUNCTIONS ###

def display_grid():
    global grid
    for row in grid:
        print(row)   

def plot_all_vertices():
    global vertices
    create_vertices()
    c.delete('vertices')
    for vertex in vertices:
        x = vertex[0] * GRIDWIDTH
        y = vertex[1] * GRIDHEIGHT
        c.create_oval(x, y, x+4, y+4, width = 0, fill = 'green', tags="vertices")

root = tk.Tk()
root.resizable(False, False)

c = tk.Canvas(root, height=700, width=1500, bg='white')
c.pack(fill=tk.BOTH, expand=True)
c.focus_force()

c.bind('<Configure>', create_grid)

# shade squares for walls
c.bind('<B1-Motion>', shade)
c.bind('<Button-1>', shade)
c.bind('<Button-1>', set_point, add="+")
c.bind('<B3-Motion>', unshade)
c.bind('<Button-3>', unshade)
c.bind('<Motion>', mouse_motion)
c.bind('s', toggle_start)
c.bind('d', toggle_destination)

#root.mainloop()
