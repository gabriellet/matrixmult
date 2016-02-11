from sys import argv
if not (len(argv) == 2 and argv[1].isdigit()):
	print( 'Usage:', argv[0], '<N>')
	exit()

n = int(argv[1])

a = [[2 for x in range(n)] for x in range(n)]
c = [[sum(map(lambda x,y:x*y, a[i], [k[i] for k in a])) for i in range(n)] for j in range(n)]

#for i in c:
	#for j in i:
		#print j,
	#print
