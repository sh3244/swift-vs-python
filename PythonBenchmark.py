# |||||||| Python version ||||||||
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

for i in xrange(100000000):
	array[:] = [x+1 for x in array]
    # for j in xrange(len(array)):
    #     array[j] += 1
        
print(array)