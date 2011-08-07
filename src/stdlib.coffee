window.alloc = (n) ->
	return new ArrayBuffer(n)

window.memcpy = (dst, src, n) ->
	[destination, source] = [new Uint8Array(dst, 0, n), new Uint8Array(src, 0, n)]
	
	destination.set(source)
	
	return dst

window.memcpy2 = (dst, dstOffset, src, srcOffset, n) ->
	[destination, source] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(src, srcOffset, n)]
	
	destination.set(source)
	
	return dst

ArrayBuffer.prototype.realloc = (n) ->
	return memcpy(new ArrayBuffer(n), this, this.byteLength)
