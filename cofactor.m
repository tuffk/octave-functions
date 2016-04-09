function cof = cofactor(X)

	cof = inv(X).'*det(X)
end;