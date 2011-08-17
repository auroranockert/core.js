endianBuffer = new Uint16Array(1)

endianBuffer[0] = 0x00FF

window.CSBigEndian = (new Uint8Array(endianBuffer.buffer)[0] == 0x00)

window.CSSwap16 = (dst, dstOffset, src, srcOffset, n) ->
	[dstArray, srcArray] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(src, srcOffset, n)]
	
	for i in [0 ... n] by 2
		[
			dstArray[i + 1],
			dstArray[i]
		] = [
			srcArray[i],
			srcArray[i + 1]
		]
	
	return dst

window.CSSwap32 = (dst, dstOffset, src, srcOffset, n) ->
	[dstArray, srcArray] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(src, srcOffset, n)]
	
	for i in [0 ... n] by 4
		[
			dstArray[i + 3],
			dstArray[i + 2],
			dstArray[i + 1],
			dstArray[i]
		] = [
			srcArray[i],
			srcArray[i + 1],
			srcArray[i + 2],
			srcArray[i + 3]
		]
	
	return dst

window.CSSwap64 = (dst, dstOffset, src, srcOffset, n) ->
	[dstArray, srcArray] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(src, srcOffset, n)]
	
	for i in [0 ... n] by 4
		[
			dstArray[i + 7],
			dstArray[i + 6],
			dstArray[i + 5],
			dstArray[i + 4]
			dstArray[i + 3],
			dstArray[i + 2],
			dstArray[i + 1],
			dstArray[i]
		] = [
			srcArray[i],
			srcArray[i + 1],
			srcArray[i + 2],
			srcArray[i + 3],
			srcArray[i + 4],
			srcArray[i + 5],
			srcArray[i + 6],
			srcArray[i + 7]
		]
	
	return dst

if window.CSBigEndian
	window.CSBigToNative16 = window.CSCopy
	window.CSBigToNative32 = window.CSCopy
	window.CSBigToNative64 = window.CSCopy
	window.CSLittleToNative16 = window.CSSwap16
	window.CSLittleToNative32 = window.CSSwap32
	window.CSLittleToNative64 = window.CSSwap64
else
	window.CSBigToNative16 = window.CSSwap16
	window.CSBigToNative32 = window.CSSwap32
	window.CSBigToNative64 = window.CSSwap64
	window.CSLittleToNative16 = window.CSCopy
	window.CSLittleToNative32 = window.CSCopy
	window.CSLittleToNative64 = window.CSCopy
