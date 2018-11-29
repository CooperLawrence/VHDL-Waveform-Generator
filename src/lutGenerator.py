import sys
from math import sin, pi

def generateSine(samples):
	print("Sine:")
	output = []
	for i in range(0, samples):
		output.append(int(128 * sin((i / samples) * pi * 2)) )#2 * PI

		print(output[i], ",")

def generateTriangle(samples):
	print("Triangle:")
	output = []
	for i in range(0, samples):
		if (i < samples // 4):
			output.append(int(128 * (i / (samples // 4))))
		elif (i >= samples // 4 and i < (samples // 4) * 3):
			output.append(int(128 * ((-i / (samples // 4)) + 2)))
		else:
			output.append(int(128 * ((i - 96) / (samples // 4))))
		
		print(output[i], ",")

def generateSquare(samples):
	print("Square:")
	output = []
	for i in range(0, samples):
		if (i < samples // 2):
			output.append(int(128 * 1))
		elif (i >= samples // 2):
			output.append(int(128 * -1))

		print(output[i], ",")

def generateSpecial(samples):
	print("Damped Sine:")
	output = []
	for i in range(0, samples):
		output.append(int(128 * sin((i / samples) * pi * 2) * (i / samples)))

		print(output[i], ",")

def main(samples):
	#generateSine(samples)
	#generateTriangle(samples)
	generateSquare(samples)
	generateSpecial(samples)

#Called at runtime
if (__name__ == "__main__"):
	main(int(sys.argv[1:][0]))
