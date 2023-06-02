# what i will receive:
# distance travelled
# degree to take to parent node
# new coordinates
# directions to take

class Edge:
    def __init__(self, childNode, parentNode):
        self.turnsToChild = []
        self.distance = 0
        self.childNode = childNode
        self.parentNode = parentNode
        self.id = str(parentNode.id)+str(childNode.id)

    def addTurn(self, degree, distance = None):
        self.turnsToChild.append(degree)
        if len(self.turnsToChild) > 1:
            self.distance += distance

    def turnsToParent(self):
        return (self.turnsToChild).reverse

class Node:
    def __init__(self, id, coordinates, parent=None):
        self.id = id
        self.coord = coordinates
        self.parent = parent
        self.children = [] # list of children nodes
    #     self.edges = {} # edges will be of the form {node.id: [degree to take to go to node, distance to node]}

    # # add edge to node
    # def addEdge(self, node, degree):
    #     self.edges[node.id] = [degree, None]

    # def addDistance(self, node, distance):
    #     self.edges[node.id][1] = distance

class Map:
    def __init__(self):
        self.rootNode = Node(1, (0, 0))
        self.nodes = {1: self.rootNode} # mapping of nodes ids to nodes, it is a bit redundant but easier to search through
        self.roverPosition = self.rootNode
        self.id = 1
        self.DFSvisited = []
        self.DFSstack = [self.rootNode]
        self.edges = {}

    # create the first junction: the root junction
    def start(self, directions):
        self.addNodeBranches(self.rootNode, directions)
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
        edge = Edge(child, parent)
        edge.addTurn(degree)
        self.edges[edge.id] = edge
    
    # move rover to node
    def moveToNode(self, node):
        while node not in self.roverPosition.children:
            # if needed: signal to rover to take the following directions back to parent
            # child = self.roverPosition
            self.roverPosition = self.roverPosition.parent
            # edgeID = str(self.roverPosition.id) + str(child.id)
            # turnsToTake = self.edges[edgeID].turnsToParent()
            # send turnsToTake to rover
            
        parent = self.roverPosition
        self.roverPosition = node # TO-DO: SEND MOVEMENT TO ROVER SEND SIGNAL TO ROVER TO SEND DIRECTIONS TAKEN
        edgeID = str(parent.id) + str(node.id)

        while 1: # TO-DO: RECEIVE THE DIRECTION TAKEN AND DISTANCE FROM LAST DIRECTION IF NEEDED
            turnDegree = None
            prevDistance = None
            self.edges[edgeID].addTurn(turnDegree, prevDistance)
        
        directions = [] # TO-DO: RECEIVE POSSIBLE DIRECTIONS FROM VISION
        parentDegree = None # TO-DO RECEIVE END DEGREE OF PATH TO ADD TO EDGES
        parentDistance = None # TO-DO RECEIVE DISTANCE FROM PARENT
        roverCoordinates = (None, None) # TO-DO RECEIVE COORDINATES OF THIS NEW NODE 

        node.addEdge(node.parent, parentDegree)
        node.addDistance(node.parent, parentDistance)
        node.parent.addDistance(node, parentDistance)
        node.coord = roverCoordinates

        return directions

arenaMap = Map()
