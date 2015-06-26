function [Gimg, M] = identifyObject(img, SetMax)
	%let user identify object
	%the energy will be set to max if max is true
	% otherwise it will be min 
	%return energe map
	
	%initial energy
	Gimg = getEnergy(img);
	
	%get user input
	imshow(img);
	[PointX, PointY] = ginput;
	PointList = [PointX PointY];
	len = size(PointX);
	%PointList(len+1) = PointList(1);
	
	%create points inside polygon
	[row, col, ~] = size(img);
	
	[imgX,imgY] = meshgrid(1:row,1:col);
	imgXY = imgX;
	imgXY(:,:,2) = imgY;
	imgPixN = row*col;
	imgXYList = reshape(imgXY, [ imgPixN, 2]);
	
	isInShape = inpolygon( imgXYList(:,1), imgXYList(:,2), PointList(:,1), PointList(:,2) );
	
	M = max(max(Gimg));
	M = -M;
	for pixI = 1 : imgPixN
		if isInShape(pixI)
			xCoord = imgXYList(pixI,1);
			yCoord = imgXYList(pixI,2);
			%set energy here
			if SetMax
				Gimg(yCoord, xCoord) = realmax;
				img(yCoord, xCoord, :) = [0 0 0];
			else
				Gimg(yCoord, xCoord) = M;
				img(yCoord, xCoord, :) = [0 0 0];
				
			end
		end
	end
	
	imwrite(img, 'Object.png');
end