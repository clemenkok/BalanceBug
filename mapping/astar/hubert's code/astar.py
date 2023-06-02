
import pathfinder_visual_ui as ui
import math

def heuristic(start, end):
    # octile distance
    # https://theory.stanford.edu/~amitp/GameProgramming/Heuristics.html
    dx = abs(start[0] - end[0])
    dy = abs(start[1] - end[1])
    D = 1 # grid size
    D2 = 2**(1/2) # diagonal distance
    return D * (dx + dy) + (D2 - (2 * D)) * min (dy, dx)


def a_star(start, destination):
    ui.create_vertices()
    visited_order = []

    startIndex = ui.vertices.index(start)
    destIndex = ui.vertices.index(destination)
    # openSet is the set of discovered nodes that need to be expanded/reexpanded
    openSet = [startIndex,]
    # For node n, cameFrom[n] is the node immediately preceding 
    # it on the cheapest path from start to n currently known
    cameFrom = [None for _ in ui.vertices]
    # For node n, gScore[n] is the cost of cheapest path from start to n
    # currently known
    gScore = [math.inf for _ in ui.vertices]
    gScore[startIndex] = 0
    # For node n, fScore[n] = gScore[n] + h(n)
    # It represents the current best guess as to how cheap
    # a path could be from start to finish if it goes through n
    # gscore is the distance from start to n
    # h(n) is the distance from n to destination
    fScore = [math.inf for _ in ui.vertices]
    fScore[startIndex] = heuristic(start, destination)

    while len(openSet) != 0:
        # current is the node in openSet with the lowest fScore value
        current = openSet[0]
        for openSetVertexIndex in openSet:
            if fScore[openSetVertexIndex] < fScore[current]:
                current = openSetVertexIndex
        if current == destIndex:
            return visited_order, cameFrom

        visited_order.append(current)
        openSet.remove(current)

        # for each neighbour of current
        for i in range(0, len(ui.vertices)):
            if ui.is_neighbour(ui.vertices[current], ui.vertices[i]):
                # tentative_gScore is the distance from start to
                # the neighbour through current
                tentative_gScore = gScore[current] + ui.direct_distance(ui.vertices[current], ui.vertices[i])
                if tentative_gScore < gScore[i]:
                    cameFrom[i] = current
                    gScore[i] = tentative_gScore
                    fScore[i] = tentative_gScore + heuristic(ui.vertices[i], destination)
                    if i not in openSet:
                        openSet.append(i)
    return None, None

def perform_astar(event=None):
    if (ui.plot_exploration_job!= None):
        ui.root.after_cancel(ui.plot_exploration_job)
        ui.plot_exploration_job = None
    ui.c.delete("waypoints")
    visited_order, cameFrom = a_star(ui.start, ui.destination)
    print("Plotting Exploration...")
    ui.plot_exploration_job = ui.root.after(0, ui.plot_exploration, visited_order, 0, cameFrom, 100)

ui.c.bind('<space>', perform_astar)
ui.root.mainloop()