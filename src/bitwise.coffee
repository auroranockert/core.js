window.CSBitwiseAND = (dst, dstOffset, a, aOffset, b, bOffset, n) ->
	[dstArray, aArray, bArray] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(a, aOffset, n), new Uint8Array(b, bOffset, n)]
	
	dstArray[i] = (aArray[i] & bArray[i]) for i in [0 ... n] by 1
	
	return dst

window.CSBitwiseNAND = (dst, dstOffset, a, aOffset, b, bOffset, n) ->
	[dstArray, aArray, bArray] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(a, aOffset, n), new Uint8Array(b, bOffset, n)]
	
	dstArray[i] = ~(aArray[i] & bArray[i]) for i in [0 ... n] by 1
	
	return dst

window.CSBitwiseNOR = (dst, dstOffset, a, aOffset, b, bOffset, n) ->
	[dstArray, aArray, bArray] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(a, aOffset, n), new Uint8Array(b, bOffset, n)]
	
	dstArray[i] = ~(aArray[i] | bArray[i]) for i in [0 ... n] by 1
	
	return dst

window.CSBitwiseNOT = (dst, dstOffset, a, aOffset, n) ->
	[dstArray, aArray] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(a, aOffset, n)]
	
	dstArray[i] = (~aArray[i]) for i in [0 ... n] by 1
	
	return dst

window.CSBitwiseOR = (dst, dstOffset, a, aOffset, b, bOffset, n) ->
	[dstArray, aArray, bArray] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(a, aOffset, n), new Uint8Array(b, bOffset, n)]
	
	dstArray[i] = (aArray[i] | bArray[i]) for i in [0 ... n] by 1
	
	return dst

window.CSBitwiseXOR = (dst, dstOffset, a, aOffset, b, bOffset, n) ->
	[dstArray, aArray, bArray] = [new Uint8Array(dst, dstOffset, n), new Uint8Array(a, aOffset, n), new Uint8Array(b, bOffset, n)]
	
	dstArray[i] = (aArray[i] ^ bArray[i]) for i in [0 ... n] by 1
	
	return dst
