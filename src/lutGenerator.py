import sys
from math import sin, pi

def generateSine(samples):
	print("Sine:")
	output = []
	for i in range(0, samples):
		output.append(sin((i / samples) * pi * 2)) #2 * PI

		print("\"", output[i], "\",")

def generateTriangle(samples):
	print("Triangle:")
	output = []
	for i in range(0, samples):
		if (i < samples // 4):
			output.append(i / (samples // 4))
		elif (i >= samples // 4 and i < (samples // 4) * 3):
			output.append((-i / (samples // 4)) + 2)
		else:
			output.append((i - 96) / (samples // 4))
		
		print("\"", output[i], "\",")

def generateSquare(samples):
	print("Square:")
	output = []
	for i in range(0, samples):
		if (i < samples // 2):
			output.append(1)
		elif (i >= samples // 2):
			output.append(-1)

		print("\"", output[i], "\",")

def generateSpecial(samples):
	print("Damped Sine:\"", end = '')
	output = []
	for i in range(0, samples):
		output.append(sin((i / samples) * pi * 2) * (i / samples))

		print("\"", output[i], "\",")

def main(samples):
	generateSine(samples)
	generateTriangle(samples)
	generateSquare(samples)
	generateSpecial(samples)

#Called at runtime
if (__name__ == "__main__"):
	main(int(sys.argv[1:][0]))
