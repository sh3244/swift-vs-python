# |||||||| Python version ||||||||
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

for i in range(100000000):
    for j in range(len(array)):
        array[j] += 1
        
print(array)