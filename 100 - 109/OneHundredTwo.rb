#Problem 102: For how many triangles in the text file does the interior contain the origin?
#Using OneHundredTwo.txt, a 27K text file containing the co-ordinates of one thousand "random" triangles,
#find the number of triangles for which the interior contains the origin.

BOTTOM = 0
MID = 1
TOP = 2
X_COORDINATE = 0
Y_COORDINATE = 1
ORIGIN = [0, 0]

#Returns true if passed in triangle input contains the origin
#Input is in the form of a string of 6 comma separated integers
def containsOrigin(f)

	#Formats input into a size 3 array of the points
	values = f.split(",").map{|x| Integer(x)}
	points = []
	for i in BOTTOM..TOP
		points << [values[i * 2], values[i * 2 + 1]]
	end

	return false if not inRectangle(points)
	#Origin is now now guaranteed to be in a y position where it is necessary to check using bounds/slopes
	#If the origin was completely below or above the triangle, the generated slopes could be incorrect

	#Sorts the input by Y Coordinate
	pointsByY = points.sort{|a, b| a[Y_COORDINATE] <=> b[Y_COORDINATE]}


	#target is bottom or top -- bottom if the origin is between the mid/bottom or top if the origin is mid/top
	target = pointsByY[MID][Y_COORDINATE] >= BOTTOM ? "bottom" : "top"
	#directPoint is the point beyond the origin from the midpoint's perspective
	directPoint = target == 'top' ? pointsByY[TOP] : pointsByY[BOTTOM]
	#longpoint is the point behind the midpoint relative to the origin
	longPoint = target == 'top' ? pointsByY[BOTTOM] : pointsByY[TOP]

	#directSlope and longSlope are the slopes from the midpoint to the directPoint and longPoint respectively
	directSlope = (pointsByY[MID][X_COORDINATE] - directPoint[X_COORDINATE]) * 1.0 / (pointsByY[MID][Y_COORDINATE] - directPoint[Y_COORDINATE])
	longSlope = (longPoint[X_COORDINATE] - directPoint[X_COORDINATE]) * 1.0 / (longPoint[Y_COORDINATE] - directPoint[Y_COORDINATE])

	#walls are the x-wise bounds of the triangle at the y coordinate of the origin
	directWall = directPoint[X_COORDINATE] - (directPoint[Y_COORDINATE] * directSlope)
	longWall = directPoint[X_COORDINATE] - (directPoint[Y_COORDINATE] * longSlope)

	leftWall = (directWall > longWall ? longWall : directWall)
	rightWall = (directWall > longWall ? directWall : longWall)

	return (leftWall < ORIGIN[X_COORDINATE] and ORIGIN[X_COORDINATE] < rightWall)
end
#returns true if the origin is within the bounds of the smallest rectangle that can fit the triangle
#input is the array of points
def inRectangle(points)
	pointsY = points.sort{|a, b| a[Y_COORDINATE] <=> b[Y_COORDINATE]}
	return false if pointsY[0][Y_COORDINATE] > ORIGIN[Y_COORDINATE]
	return false if pointsY[2][Y_COORDINATE] < ORIGIN[Y_COORDINATE]
	pointsX = points.sort{|a, b| a[X_COORDINATE] <=> b[X_COORDINATE]}
	return false if pointsX[0][X_COORDINATE] > ORIGIN[X_COORDINATE]
	return false if pointsX[2][X_COORDINATE] < ORIGIN[X_COORDINATE]
	return true
end
inputFile = File.new('OneHundredTwo.txt')
count = 0
while(f = inputFile.gets)
	count += 1 if containsOrigin(f);
end
puts count
