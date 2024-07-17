import sys

def main():
	if len(sys.argv) != 2:
		print("Usage: python reverse.py <string>")
		sys.exit(1)

	string = sys.argv[1]

	output = open(string, 'r')
	output = output.read()

	for i in range(len(output) - 1):
		sys.stdout.write(unichr((ord(output[i]) - i) % 0x110000))
	print("\n")

if __name__ == "__main__":
	main()
