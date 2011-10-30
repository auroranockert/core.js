window.CSLoadFewBits = (src, offset, n) ->
	a = CSLoadBigUInt16(src, Math.floor(offset / 8)) << (offset % 8)
	
	return a >> (16 - n)
