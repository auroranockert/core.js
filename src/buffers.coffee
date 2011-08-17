window.CSCopy = (dst, dstOffset, src, srcOffset, n) ->
	[destination, source] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(src, srcOffset, n)]
	
	destination.set(source)
	
	return dst


window.CSCompare = (a, aOffset, b, bOffset, n) ->
	[a, b] = [new Uint8Array(a, aOffset, n), new Uint8Array(b, bOffset, n)]
	
	for i in [0 ... n] by 1
		return false if a[i] != b[i]
	
	return true
