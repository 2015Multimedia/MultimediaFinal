function [vector] = FindSeam(I, Gimg, decide, test)
	%Find a seam in img I
	%where the energy is specified by Gimg

	%calculating image gradient as an energy image
[rmax, cmax, tmp] = size(I);
ImgOut = I;

    if(decide == 2)
        vector = zeros(cmax, 1);
        testcol = test;
        mincol = min(testcol(:,cmax));
        locations=find(testcol(:,cmax)==mincol);
        [y,x]=size(locations);
	%back tracking to find the seam
		for loc=1:y
		j = locations(loc,1);
		for col=cmax:-1:2
			if col==cmax
	%		    ImgOut(row,j,1)=255;
	%		    ImgOut(row,j,2)=0;
	%		    ImgOut(row,j,3)=0;
				testcol(j,col) = realmax;
				vector(col) = j;
			end
			%if row < rmax
				if j==1
					j2 = j+1;
					while testcol(j+1,col-1)==realmax && j2<rmax
						j2=j2+1;
					end
					tmp=[testcol(j,col-1),testcol(j2,col-1)];
					[C,index]=min(tmp);
					if index==1
	%		            ImgOut(row-1,j,1)=255;
	%		            ImgOut(row-1,j,2)=0;
	%		            ImgOut(row-1,j,3)=0;
						testcol(j,col-1) = realmax;
						vector(col-1) = j;
					end
					if index==2
	%		            ImgOut(row-1,j+1,1)=255;
	%		            ImgOut(row-1,j+1,2)=0;
	%		            ImgOut(row-1,j+1,3)=0;
						j=j2;
						vector(col-1) = j;
						testcol(j,col-1) = realmax;
					end
				end
				if j>1 && j<rmax
					j1 = j-1;
					j2 = j+1;
					while testcol(j1,col-1) == realmax && j1>1
						j1 = j1-1;
					end
					while testcol(j+1,col-1)==realmax && j2<rmax
						j2=j2+1;
					end
					tmp1=[testcol(j,col-1),testcol(j2,col-1),testcol(j1,col-1)];
					[C,index]=min(tmp1);
					if index==1
	%		            ImgOut(row-1,j,1)=255;
	%		            ImgOut(row-1,j,2)=0;
	%		            ImgOut(row-1,j,3)=0;
						testcol(j,col-1) = realmax;
						vector(col-1) = j;
					end
					if index==2
	%		            ImgOut(row-1,j+1,1)=255;
	%		            ImgOut(row-1,j+1,2)=0;
	%		            ImgOut(row-1,j+1,3)=0;
						j=j2;
						vector(col-1) = j;
						testcol(j,col-1) = realmax;
					end
					if index==3
	%		            ImgOut(row-1,j-1,1)=255;
	%		            ImgOut(row-1,j-1,2)=0;
	%		            ImgOut(row-1,j-1,3)=0;
						j=j1;
						vector(col-1) = j;
						testcol(j,col-1) = realmax;
					end
				end
				if j == rmax
					j1 = j-1;
					while testcol(j1,col-1) == realmax && j1>1
						j1 = j1-1;
					end
					tmp2=[testcol(j,col-1),testcol(j1,col-1)];
					[C,index]=min(tmp2);
					if index==1
	%		            ImgOut(row-1,j,1)=255;
	%		            ImgOut(row-1,j,2)=0;
	%		            ImgOut(row-1,j,3)=0;
						vector(col-1) = j;
						testcol(j,col-1) = realmax;
					end
					if index==2
	%		            ImgOut(row-1,j-1,1)=255;
	%		            ImgOut(row-1,j-1,2)=0;
	%		            ImgOut(row-1,j-1,3)=0;
						j=j1;
						vector(col-1) = j;
						testcol(j,col-1) = realmax;
					end
				end
			%end
		end
	end
    end
    
    if(decide == 1)
        vector = zeros(rmax, 1);
        testrow = test;
        minrow = min(testrow(rmax,:));
        locations=find(testrow(rmax,:)==minrow);
        [x,y]=size(locations);
	%back tracking to find the seam
		for loc=1:y
		j = locations(1,loc);
		for row=rmax:-1:2
			if row==rmax
	%		    ImgOut(row,j,1)=255;
	%		    ImgOut(row,j,2)=0;
	%		    ImgOut(row,j,3)=0;
				testrow(row,j) = realmax;
				vector(row) = j;
			end
			%if row < rmax
				if j==1
					j2 = j+1;
					while testrow(row-1,j+1)==realmax && j2<cmax
						j2=j2+1;
					end
					tmp=[testrow(row-1,j),testrow(row-1,j2)];
					[C,index]=min(tmp);
					if index==1
	%		            ImgOut(row-1,j,1)=255;
	%		            ImgOut(row-1,j,2)=0;
	%		            ImgOut(row-1,j,3)=0;
						testrow(row-1,j) = realmax;
						vector(row-1) = j;
					end
					if index==2
	%		            ImgOut(row-1,j+1,1)=255;
	%		            ImgOut(row-1,j+1,2)=0;
	%		            ImgOut(row-1,j+1,3)=0;
						j=j2;
						vector(row-1) = j;
						testrow(row-1,j) = realmax;
					end
				end
				if j>1 && j<cmax
					j1 = j-1;
					j2 = j+1;
					while testrow(row-1,j1) == realmax && j1>1
						j1 = j1-1;
					end
					while testrow(row-1,j+1)==realmax && j2<cmax
						j2=j2+1;
					end
					tmp1=[testrow(row-1,j),testrow(row-1,j2),testrow(row-1,j1)];
					[C,index]=min(tmp1);
					if index==1
	%		            ImgOut(row-1,j,1)=255;
	%		            ImgOut(row-1,j,2)=0;
	%		            ImgOut(row-1,j,3)=0;
						testrow(row-1,j) = realmax;
						vector(row-1) = j;
					end
					if index==2
	%		            ImgOut(row-1,j+1,1)=255;
	%		            ImgOut(row-1,j+1,2)=0;
	%		            ImgOut(row-1,j+1,3)=0;
						j=j2;
						vector(row-1) = j;
						testrow(row-1,j) = realmax;
					end
					if index==3
	%		            ImgOut(row-1,j-1,1)=255;
	%		            ImgOut(row-1,j-1,2)=0;
	%		            ImgOut(row-1,j-1,3)=0;
						j=j1;
						vector(row-1) = j;
						testrow(row-1,j) = realmax;
					end
				end
				if j == cmax
					j1 = j-1;
					while testrow(row-1,j1) == realmax && j1>1
						j1 = j1-1;
					end
					tmp2=[testrow(row-1,j),testrow(row-1,j1)];
					[C,index]=min(tmp2);
					if index==1
	%		            ImgOut(row-1,j,1)=255;
	%		            ImgOut(row-1,j,2)=0;
	%		            ImgOut(row-1,j,3)=0;
						vector(row-1) = j;
						testrow(row-1,j) = realmax;
					end
					if index==2
	%		            ImgOut(row-1,j-1,1)=255;
	%		            ImgOut(row-1,j-1,2)=0;
	%		            ImgOut(row-1,j-1,3)=0;
						j=j1;
						vector(row-1) = j;
						testrow(row-1,j) = realmax;
					end
				end
			%end
		end
	end
    end
	
%imshow(ImgOut);
%imshow(I);
%imwrite(ImgOut, 'b.png');
end
