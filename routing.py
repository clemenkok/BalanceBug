# what i will receive:
# distance travelled and end degree
# new coordinates
# directions to take

class Node:
    def __init__(self, id, coordinates, parent=None):
        self.id = id
        self.coord = coordinates
        self.parent = parent
        self.children = [] # list of children nodes
        self.edges = {} # edges will be of the form {node.id: [degree to take to go to node, distance to node]}

    # add edge to 
    def addEdge(self, node, degree):
        self.edges[node.id] = [degree]

    def addDistance(self, node, distance):
        self.edges[node.id].append(distance)

class Map:
    def __init__(self):
        self.rootNode = Node(1, (0, 0))
        self.nodes = {1: self.rootNode} # mapping of nodes ids to nodes, it is a bit redundant but easier to search through
        self.roverPosition = self.rootNode
        self.id = 1
        self.DFSvisited = []
        self.DFSstack = [self.rootNode]

    # create the first junction: the root junction
    def start(self, directions):
        self.createJuncBranches(self.rootNode, directions)
        self.DFS()

    def DFS(self):
        while len(self.DFSstack) != 0:
            node = self.DFSstack[-1]
            if node!=self.rootNode:
                directions = self.moveToNode(node)
            for existingN in self.nodes:
                if (existingN.coord == node.coord) & (existingN != node):
                    self.DFSstack.remove(node)
                    for exN in self.nodes:
                        if node in exN.children:
                            exN.children.remove(node)
            if node:
                self.addNodeBranches(node, directions)
                self.DFSstack.remove(node)
                self.DFSvisited.append(node)

    # method to create a node at a given coordinate and create branches for its children
    def addNodeBranches(self, node, directions):
        for degree in directions:
            self.addChild(self, node, degree)
        
        for child in node.children:
            self.DFSstack.append(child)

    # method to create a child to a parent
    def addChild(self, parent, degree):
        self.id += 1
        child = Node(self.id, None, parent)
        self.nodes[child.id] = child
        parent.children.append(child)
        parent.addEdge(child, degree)
    
    # move rover to node
    def moveToNode(self, node):
        while node not in self.roverPosition.children:
            self.roverPosition = self.roverPosition.parent
        self.roverPosition = node # TO-D0 SEND MOVEMENT TO ROVER

        directions = [] # TO-DO: RECEIVE POSSIBLE DIRECTIONS FROM VISION
        parentDegree = None # TO-DO RECEIVE END DEGREE OF PATH TO ADD TO EDGES
        parentDistance = None # TO-DO RECEIVE DISTANCE FROM PARENT
        roverCoordinates = (None, None) # TO-DO RECEIVE COORDINATES OF THIS NEW NODE 

        node.addEdge(node.parent, parentDegree)
        node.addDistance(node.parent, parentDistance)
        node.parent.addDistance(node, parentDistance)
        node.coord = roverCoordinates

        return directions
    
    def getConnectedNodes(self):
        return list(self.roverPosition.connections.keys())

arenaMap = Map()
