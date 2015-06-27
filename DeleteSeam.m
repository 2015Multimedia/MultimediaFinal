function img = DeleteSeam(vector, I, decide)
	%delete a seam in I specify by vector
	
	[rmax, cmax, tmp] = size(I);
    if(decide == 2)
        cmax = size(vector);
		for col=1:cmax
			[row, index] = max(vector(col,: ));
			I(row:rmax-1, col,:) = I(row+1:rmax, col,:);
			vector(col, index) = 0;
		end
		I(rmax, :, :) = [];
    end
	
    if(decide == 1)
        rmax = size(vector);
        for row=1:rmax
			[col, index] = max(vector(row, :));
			I(row, col:cmax-1,:) = I(row, col+1:cmax,:);
			vector(row, index) = 0;
		end
		I(:, cmax, :) = [];
    end

	img = I;
end
