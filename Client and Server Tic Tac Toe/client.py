from socket import *
import sys

#Loopback address
serverName = "127.0.0.1"
serverPort = int(sys.argv[1])
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName, serverPort))
while True:
	sentence = raw_input("Enter a command: ")
	#Check for missing input.
	if "place" in sentence and len(sentence) <= 6:
		print "Missing element: place"
		print "Usage: place <number>"
		continue
	elif "start" in sentence and len(sentence) <= 6:
		print "Missing element: start"
		print "Usage: start <player>"
		continue
	#Check for invalid input.
	elif "place" in sentence and not sentence[6:].isdigit():
		print "Invalid element: place"
		print "Usage: place <number>"
		continue
	elif "start" in sentence and not (sentence[6:] == "X" or sentence[6:] == "O"):
		print "Invalid element: start"
		print "Usage: start <player>"
		continue
	elif "score" in sentence and len(sentence) > 5:
		print "Invalid element: score"
		print "Usage: score"
		continue
	elif "status" in sentence and len(sentence) > 6:
		print "Invalid element: status"
		print "Usage: status"
		continue
	elif "list" in sentence and len(sentence) > 4:
		print "Invalid element: list"
		print "Usage: list"
		continue
	elif "reset" in sentence and len(sentence) > 5:
		print "Invalid element: reset"
		print "Usage: reset"
		continue
	elif "exit" in sentence and len(sentence) > 4:
		print "Invalid element: exit"
		print "Usage: exit"
		continue
	elif "quit" in sentence and len(sentence) > 4:
		print "Invalid element: quit"
		print "Usage: quit"
		continue
	#Check for invalid commands.
	elif "place" not in sentence and "start" not in sentence and sentence != "status" and sentence != "reset" and sentence != "score" and sentence != "list" and sentence != "exit" and sentence != "quit":
		print "Invalid command"
		print "Commands:"
		print "exit"
		print "quit"
		print "place"
		print "status"
		print "reset"
		print "score"
		print "list"
		print "start"
		continue
	clientSocket.send(sentence)
	#Shuts down the client as well
	if sentence == "exit" or sentence == "quit":
		break;
	#Displays the scoreboard.
	if sentence == "score":
		curState = clientSocket.recv(1024)
		print('From Server: ')
		print "Player 1 (X): ", curState[0]
		print "Player 2 (O): ", curState[1]
		print "Ties: ", curState[2]
	#Places an X or an O on a square.
	elif "place" in sentence:
		curState = clientSocket.recv(1024)
		print('From Server: ')
		i = 0
		while i < 7:
			print curState[i], " ", curState[i + 1], " ", curState[i + 2]
			i += 3
	#Check the status.
	elif sentence == "status":
		print('From Server: ')
		curState = clientSocket.recv(1024)
		print curState
	#Start a new game.
	elif sentence == "reset":
		curState = clientSocket.recv(1024)
		while i < len(curState) - 2:
			print curState[i], " ", curState[i + 1], " ", curState[i + 2]
			i += 3
	#List the command history.
	elif sentence == "list":
		print('From Server: ')
		curState = clientSocket.recv(1024)
		print curState
	#Decide who goes first in a game.
	elif "start" in sentence:
		print('From Server: ')
		curState = clientSocket.recv(1024)
		print curState
clientSocket.close()
