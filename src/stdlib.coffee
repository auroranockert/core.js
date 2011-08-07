window.CSAlloc = (n) ->
	return new ArrayBuffer(n)

window.CSCopy = (dst, dstOffset, src, srcOffset, n) ->
	[destination, source] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(src, srcOffset, n)]
	
	destination.set(source)
	
	return dst

window.CSRealloc = (buffer, n) ->
	return CSCopy(new ArrayBuffer(n), 0, buffer, 0, Math.min(n, buffer.byteLength))

window.CSCompare = (a, aOffset, b, bOffset, n) ->
	[a, b] = [new Uint8Array(a, aOffset, n), new Uint8Array(b, bOffset, n)]
	
	for i in [0 ... n] by 1
		return false if a[i] != b[i]
	
	return true

window.CSCopyFromString = (dst, dstOffset, src, srcOffset, n) ->
	destination = new Uint8Array(dst, dstOffset, n)
	
	destination[i] = src.charCodeAt(srcOffset + i) for i in [0 ... n] by 1
	
	return dst

window.CSStringToBuffer = (string) ->
	a = new Uint8Array(string.length)
	
	a[i] = string.charCodeAt(i) for i in [0 ... string.length] by 1
	
	return a.buffer

endianBuffer = new Uint8Array(2)

endianBuffer[0] = 0xFF
endianBuffer[1] = 0x00

window.CSBigEndian = new Uint16Array(endianBuffer.buffer)[0] != 0xFF

window.CSByteSwap16 = (b) -> ((b & 0xFF00) >> 8) + ((b & 0x00FF) << 8)
window.CSByteSwap32 = (b) -> ((b & 0xFF000000) >> 24) + ((b & 0x00FF0000) >> 8) + ((b & 0x0000FF00) << 8) + ((b & 0x000000FF) << 24)

if window.CSBigEndian
	window.CSBig16ToNative = (b) -> b & 0xFFFF
	window.CSBig32ToNative = (b) -> b & 0xFFFFFFFF
	window.CSLittle16ToNative = CSByteSwap16
	window.CSLittle32ToNative = CSByteSwap32
else
	window.CSBig16ToNative = CSByteSwap16
	window.CSBig32ToNative = CSByteSwap32
	window.CSLittle16ToNative = (b) -> b & 0xFFFF
	window.CSLittle32ToNative = (b) -> b & 0xFFFFFFFF
