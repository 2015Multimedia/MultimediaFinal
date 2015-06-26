function img = DeleteSeam(vector, I)
	%delete a seam in I specify by vector
	
	[rmax, cmax, tmp] = size(I);
	[rmax, ~] = size(vector);
	for row=1:rmax
		[col, index] = max(vector(row, :));
		I(row, col:cmax-1,:) = I(row, col+1:cmax,:);
		vector(row, index) = 0;
	end
	I(:, cmax, :) = [];
	cmax = cmax-1;
	img = I;
end