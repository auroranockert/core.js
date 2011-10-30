window.CSLoadInt8 = (src, offset) ->
	return new Int8Array(src)[offset]

window.CSLoadUInt8 = (src, offset) ->
	return new Uint8Array(src)[offset]

window.CSLoadNativeInt16 = (src, offset) ->
	return new Int16Array(window.CSReadNative16(src, offset))[0]

window.CSLoadNativeInt32 = (src, offset) ->
	return new Int32Array(window.CSReadNative32(src, offset))[0]

window.CSLoadNativeUInt16 = (src, offset) ->
	return new Uint16Array(window.CSReadNative16(src, offset))[0]

window.CSLoadNativeUInt32 = (src, offset) ->
	return new Uint32Array(window.CSReadNative32(src, offset))[0]

window.CSLoadNativeFloat32 = (src, offset) ->
	return new Float32Array(window.CSReadNative32(src, offset))[0]

window.CSLoadNativeFloat64 = (src, offset) ->
	return new Float64Array(window.CSReadNative64(src, offset))[0]

window.CSLoadBigInt16 = (src, offset) ->
	return new Int16Array(window.CSReadBig16(src, offset))[0]

window.CSLoadBigInt32 = (src, offset) ->
	return new Int32Array(window.CSReadBig32(src, offset))[0]

window.CSLoadBigUInt16 = (src, offset) ->
	return new Uint16Array(window.CSReadBig16(src, offset))[0]

window.CSLoadBigUInt32 = (src, offset) ->
	return new Uint32Array(window.CSReadBig32(src, offset))[0]

window.CSLoadBigFloat32 = (src, offset) ->
	return new Float32Array(window.CSReadBig32(src, offset))[0]

window.CSLoadBigFloat64 = (src, offset) ->
	return new Float64Array(window.CSReadBig64(src, offset))[0]

window.CSLoadLittleInt16 = (src, offset) ->
	return new Int16Array(window.CSReadLittle16(src, offset))[0]

window.CSLoadLittleInt32 = (src, offset) ->
	return new Int32Array(window.CSReadLittle32(src, offset))[0]

window.CSLoadLittleUInt16 = (src, offset) ->
	return new Uint16Array(window.CSReadLittle16(src, offset))[0]

window.CSLoadLittleUInt32 = (src, offset) ->
	return new Uint32Array(window.CSReadLittle32(src, offset))[0]

window.CSLoadLittleFloat32 = (src, offset) ->
	return new Float32Array(window.CSReadLittle32(src, offset))[0]

window.CSLoadLittleFloat64 = (src, offset) ->
	return new Float64Array(window.CSReadLittle64(src, offset))[0]
