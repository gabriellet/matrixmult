import argv from sys
if not (len(argv) == 2 and argv[1].isdigit()):
	print 'Usage:', argv[0], '<N>'
	exit()

n = int(argv[1])

a = [[2 for x in xrange(n)] for x in xrange(n)]
b = [[2 for x in xrange(n)] for x in xrange(n)]
c = [[sum(map(lambda x,y:x*y, a[i], [k[i] for k in b])) for i in range(n)] for j in range(n)]

#for i in c:
	#for j in i:
		#print j,
	#print
