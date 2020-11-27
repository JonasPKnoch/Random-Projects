class Board:
    def __init__(this):
        this.shipMark = []
        this.shipHealth = []
        this.hitMark = []
        for x in range(10):
            shipRow = []
            hitRow = []
            for y in range(10):
                shipRow.append(0)
                hitRow.append(0)
            this.shipMark.append(shipRow)
            this.hitMark.append(hitRow)

    def insertShip(this, x, y, size, vert):
        this.shipHealth.append(size)

        try:
            for i in range(size):
                if not vert and this.shipMark[x+i][y] != 0: Exception("Space is occupied")
                if vert and this.shipMark[x][y+i] != 0: raise Exception("Space is occupied")
        except:
            return -1
        
        for i in range(size):
            if vert: this.shipMark[x][y+i] = len(this.shipHealth)
            else: this.shipMark[x+i][y] = len(this.shipHealth)
        return 0

    def hit(this, x, y):
        try:
            if this.hitMark[x][y] != 0: raise Exception("Already tried that space")
        except:
            return -1

        if this.shipMark[x][y] == 0:
            this.hitMark[x][y] = 1
            return 0
        else:
            this.hitMark[x][y] = 2
            this.shipHealth[this.shipMark[x][y]-1] -= 1
            if this.shipHealth[this.shipMark[x][y]-1] == 0: return 2
            else: return 1

class Game:
    def __init__(this):
        this.p1 = Board()
        this.p2 = Board()
        this.runGame()
        

    def runGame(this):
        phases = [[print,"Player 1, place your ships"],
                  [this.placeShips,this.p1],
                  [print,"Player 2, place your ships"],
                  [this.placeShips,this.p2],
                  [print,"Time to play"],
                  [this.battle],
                  [print,"Game over"],
                  [print,"Game restarting..."],
                  [this.__init__]]
        currentPhase = 0
        for i in range(len(phases)):
            if len(phases[i]) == 2: phases[i][0](phases[i][1])
            else: phases[i][0]()

    def placeShips(this, board):
        shipList = [5,4,3,3,2]
        while len(shipList) > 0:
            this.drawShips(board)
            p = convertInput(input("Where do you place your size "+str(shipList[0])+" ship? "))
            v = input("Vertical or Horizontal? ")
            if v.lower().find("v") != -1:
                v = True
            elif v.lower().find("h") != -1:
                v = False
            else:
                v = -1
            
            if p != -1 and v != -1:
                if board.insertShip(p[0],p[1],shipList[0],v) != -1:
                    shipList.pop(0)
                else:
                    print("Enter a valid location")
            else:
                print("Enter a location like a1 and a valid orientaiton")
        this.drawShips(board)

    def battle (this):
        winner = -1
        turn = this.p1
        target = this.p2
        while winner == -1:
            if turn == this.p1:
                print("Player 1, take your turn")
                target = this.p2
            else:
                print("Player 2, take your turn")
                target = this.p1

            this.drawBoard(turn)
            p = convertInput(input("Where do you attack? "))
            if p != -1:
                h = target.hit(p[0],p[1])
                if h == 2:
                    print("You sunk their battleship!")
                elif h == 1:
                    print("Hit!")
                elif h == 0:
                    print("Miss")
                    if turn == this.p1: turn = this.p2
                    else: turn = this.p1
                else:
                    print("Enter a valid location")
            else:
                print("Enter a locaiton like a1")
            
            go = False
            for i in range(len(target.shipHealth)):
                if target.shipHealth[i] > 0: go = True
            if not go:
                if turn == this.p1:
                    print("Player 1 wins!")
                    winner = 0
                else:
                    print("Player 2 wins!")
                    winner = 1
                    
            

    def drawShips(this, board):
        print(" 1 2 3 4 5 6 7 8 9 10")
        for y in range(len(board.shipMark[0])):
            letters = "ABCDEFGHIJ"
            row = letters[y]
            for x in range(len(board.shipMark)):
                if board.hitMark[x][y] == 2: row += "X"
                elif board.hitMark[x][y] == 1: row += "O"
                elif board.shipMark[x][y] > 0: row += "#"
                else: row += "."
                row += " "
            print(row)

    def drawHits(this, board):
        print(" 1 2 3 4 5 6 7 8 9 10")
        for y in range(len(board.hitMark[0])):
            letters = "ABCDEFGHIJ"
            row = letters[y]
            for x in range(len(board.hitMark)):
                if board.hitMark[x][y] == 2: row += "X"
                elif board.hitMark[x][y] == 1: row += "O"
                else: row += "-"
                row += " "
            print(row)

    def drawBoard(this, board):
        if board == this.p1: this.drawHits(this.p2)
        else: this.drawHits(this.p1)
        print(" ================== ")
        this.drawShips(board)
    


def convertInput(inp):
    inp = inp.replace(" ","").lower()
    try:
        ret = ["12345678910".find(inp[1:]),"abcdefghij".find(inp[0])]
        if ret[0] == -1 or ret[1] == -1 or len(ret) > 2 or ret[1] > 9: raise Exception("Bad Input")
    except:
        return -1
    return ret

g = Game()






    
