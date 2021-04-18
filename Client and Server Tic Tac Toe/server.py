from socket import *
import sys
from datetime import datetime

#Check if X is the winner.
def xWins(string):
	return string[0] == string[1] and string[1] == string[2] and string[1] == "X" or string[3] == string[4] and string[4] == string[5] and string[4] == "X" or string[6] == string[7] and string[7] == string[8] and string[7] == "X" or string[0] == string[3] and string[3] == string[6] and string[3] == "X" or string[1] == string[4] and string[4] == string[7] and string[4] == "X" or string[2] == string[5] and string[5] == string[8] and string[5] == "X" or string[0] == string[4] and string[4] == string[8] and string[4] == "X" or string[2] == string[4] and string[4] == string[6] and string[4] == "X"

#Check if O is the winner.
def oWins(string):
	return string[0] == string[1] and string[1] == string[2] and string[1] == "O" or string[3] == string[4] and string[4] == string[5] and string[4] == "O" or string[6] == string[7] and string[7] == string[8] and string[7] == "O" or string[0] == string[3] and string[3] == string[6] and string[3] == "O" or string[1] == string[4] and string[4] == string[7] and string[4] == "O" or string[2] == string[5] and string[5] == string[8] and string[5] == "O" or string[0] == string[4] and string[4] == string[8] and string[4] == "O" or string[2] == string[4] and string[4] == string[6] and string[4] == "O"

#Check if board is full to declare draw.
def isFull(string):
	for i in range(len(string)):
		if string[i] == "*":
			return False
	return True
#Command line argument for port number.
serverPort = int(sys.argv[1])
serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind(('', serverPort))
serverSocket.listen(1)
#Prints out the date and time and port number.
print(str(datetime.today()) + " servername starting on port " + str(serverPort))
print "Welcome to Tic-Tac-Toe Game!"
print "Player 1 is X"
print "Player 2 is O"
print "The Square Numbers"
print "012"
print "345"
print "678"
connectionSocket, addr = serverSocket.accept()
commands = []
s = "*********"
player1 = 0
player2 = 0
ties = 0
i = 0
startingPlayer = ""
while True:
	sentence = connectionSocket.recv(1024).decode()
	#Shuts down the server.
	if sentence == "exit" or sentence == "quit":
		break
	#Resets the board to the initial state.
	elif sentence == "reset":
		startingPlayer = ""
		s = "*********"
		commands.append(sentence)
		connectionSocket.send(s)
	#Places an X or an O on a vacant square.
	elif "place" in sentence:
		if startingPlayer == "":
			print "Error: Starting player not decided."
		else:
			if len(sentence) > 5:
				location = int(sentence[6:])
				#Check for illegal locations.
				if location >= 9:
					print "Illegal location"
					connectionSocket.send(s)
				#Make sure the square is vacant.
				elif s[location] != "*":
					print "Square is already filled." 
					connectionSocket.send(s)
				#Make sure board is not in terminal state.
				elif xWins(s) or oWins(s):
					print "Board is already in terminal state."
					connectionSocket.send(s)
				elif location <= 8:
					#Places X or O on square.
					if startingPlayer == "X":
						if i % 2 == 0:
							board = list(s)
							board[location] = "X"
							s = "".join(board)
						else:
							board = list(s)
							board[location] = "O"
							s = "".join(board)
						i += 1
					else:
						if i % 2 == 0:
							board = list(s)
							board[location] = "O"
							s = "".join(board)
						else:
							board = list(s)
							board[location] = "X"
							s = "".join(board)
						i += 1
					commands.append(sentence)
					#Check status and update score.
					if xWins(s):
						player1 += 1
						i = 0
					elif oWins(s):
						player2 += 1
						i = 0
					elif isFull(s):
						ties += 1 #Draw
						i = 0
		connectionSocket.send(s)
	#Check score.
	elif sentence == "score":
		commands.append(sentence)
		connectionSocket.send(str(player1) + str(player2) + str(ties))
	#Check game status.
	elif sentence == "status":
		commands.append(sentence)
		if xWins(s):
			connectionSocket.send("Congratulations! Player 1 (X)")
		elif oWins(s):
			connectionSocket.send("Congratulations! Player 2 (O)")
		elif isFull(s):
			connectionSocket.send("Draw")
		else:
			connectionSocket.send("In Progress")
	#Lists the commands.
	elif sentence == "list":
		for command in commands:
			print(command)
		commands.append(sentence)
		#Tells the client that server printed the commands.
		connectionSocket.send("Commands printed in server.")
	#Decide who goes first in a game.
	elif "start" in sentence:
		#Make sure that the game is not in progress.
		if startingPlayer != "":
			print "Starting Player already decided."
			connectionSocket.send("Try another command.")
		else:
			startingPlayer = sentence[6:]
			connectionSocket.send(sentence[6:] + " goes first.")
		commands.append(sentence)
connectionSocket.close()
