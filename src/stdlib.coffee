window.alloc = (n) ->
	return new ArrayBuffer(n)

window.memcpy = (dst, src, n) ->
	for i in [0 ... n]
		dst[i] = src[i]
	
	return dst

window.memcpy2 = (dst, dstOffset, src, srcOffset, n) ->
	[a, b] = [dstOffset, srcOffset]
	
	for i in [0 ... n]
		dst[a] = src[b]
		
		a += 1; b += 1
	
	return dst

ArrayBuffer.prototype.realloc = (n) ->
	return memcpy(new ArrayBuffer(n), this)
