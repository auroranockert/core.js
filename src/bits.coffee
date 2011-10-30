window.CSLoadFewBits = (src, offset, n) ->
	a = CSReadBigUint16(src, Math.floor(offset / 8)) << (offset % 8)
	
	return a >> (16 - n)
