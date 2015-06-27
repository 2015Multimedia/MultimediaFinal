function removeSeams(img, rnum, cnum, obj, Gimg)
	%remove num of seams in img
	%if obj is true
	% the energy map will be Gimg
	% otherwise calculate the energy map
    num = rnum + cnum;
	if not(obj)
		for i=1:num
			Gimg = getEnergy(img);
            [test, decide] = decide(img, Gimg, rnum, cnum);
			vec = FindSeam(img, Gimg, decide, test);
            if(decide == 2)
                cnum = cnum-1;
            end
            if(decide == 1)
                rnum = rnum-1;
            end
            img = DeleteSeam(vec, img, decide);
		end
	else
		for i=1:num
			vec = FindSeam(img, Gimg);
			img = DeleteSeam(vec, img);
			Gimg = DeleteSeam(vec, Gimg);
		end
	end
	imshow(img);
	imwrite(img, 'remove.png');
end
