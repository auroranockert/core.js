window.CSAlloc = (n) ->
	return new ArrayBuffer(n)

window.CSRealloc = (buffer, n) ->
	return window.CSCopy(CSAlloc(n), 0, buffer, 0, Math.min(n, buffer.byteLength))

window.CSRead = (src, offset, n) ->
	return window.CSCopy(CSAlloc(n), 0, src, offset, n)

window.CSReadNative16 = (src, offset) ->
	return window.CSRead(src, offset, 2)

window.CSReadNative32 = (src, offset) ->
	return window.CSRead(src, offset, 4)

window.CSReadNative64 = (src, offset) ->
	return window.CSRead(src, offset, 8)

window.CSReadBig16 = (src, offset) ->
	return window.CSBigToNative16(CSAlloc(2), 0, src, offset, 2)

window.CSReadBig32 = (src, offset) ->
	return window.CSBigToNative32(CSAlloc(4), 0, src, offset, 4)

window.CSReadBig64 = (src, offset) ->
	return window.CSBigToNative64(CSAlloc(8), 0, src, offset, 8)

window.CSReadLittle16 = (src, offset) ->
	return window.CSLittleToNative16(CSAlloc(2), 0, src, offset, 2)

window.CSReadLittle32 = (src, offset) ->
	return window.CSLittleToNative32(CSAlloc(4), 0, src, offset, 4)

window.CSReadLittle64 = (src, offset) ->
	return window.CSLittleToNative64(CSAlloc(8), 0, src, offset, 8)