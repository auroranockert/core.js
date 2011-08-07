(function() {
  var endianBuffer;
  window.CSAlloc = function(n) {
    return new ArrayBuffer(n);
  };
  window.CSCopy = function(dst, dstOffset, src, srcOffset, n) {
    var destination, source, _ref;
    _ref = [new Uint8Array(dst, dstOffset, n), new Uint8Array(src, srcOffset, n)], destination = _ref[0], source = _ref[1];
    destination.set(source);
    return dst;
  };
  window.CSRealloc = function(buffer, n) {
    return CSCopy(new ArrayBuffer(n), 0, buffer, 0, Math.min(n, buffer.byteLength));
  };
  window.CSCompare = function(a, aOffset, b, bOffset, n) {
    var i, _ref;
    _ref = [new Uint8Array(a, aOffset, n), new Uint8Array(b, bOffset, n)], a = _ref[0], b = _ref[1];
    for (i = 0; i < n; i += 1) {
      if (a[i] !== b[i]) {
        return false;
      }
    }
    return true;
  };
  window.CSCopyFromString = function(dst, dstOffset, src, srcOffset, n) {
    var destination, i;
    destination = new Uint8Array(dst, dstOffset, n);
    for (i = 0; i < n; i += 1) {
      destination[i] = src.charCodeAt(srcOffset + i);
    }
    return dst;
  };
  window.CSStringToBuffer = function(string) {
    var a, i, _ref;
    a = new Uint8Array(string.length);
    for (i = 0, _ref = string.length; i < _ref; i += 1) {
      a[i] = string.charCodeAt(i);
    }
    return a.buffer;
  };
  endianBuffer = new Uint8Array(2);
  endianBuffer[0] = 0xFF;
  endianBuffer[1] = 0x00;
  window.CSBigEndian = new Uint16Array(endianBuffer.buffer)[0] !== 0xFF;
  window.CSByteSwap16 = function(b) {
    return ((b & 0xFF00) >> 8) + ((b & 0x00FF) << 8);
  };
  window.CSByteSwap32 = function(b) {
    return ((b & 0xFF000000) >> 24) + ((b & 0x00FF0000) >> 8) + ((b & 0x0000FF00) << 8) + ((b & 0x000000FF) << 24);
  };
  if (window.CSBigEndian) {
    window.CSBig16ToNative = function(b) {
      return b & 0xFFFF;
    };
    window.CSBig32ToNative = function(b) {
      return b & 0xFFFFFFFF;
    };
    window.CSLittle16ToNative = CSByteSwap16;
    window.CSLittle32ToNative = CSByteSwap32;
  } else {
    window.CSBig16ToNative = CSByteSwap16;
    window.CSBig32ToNative = CSByteSwap32;
    window.CSLittle16ToNative = function(b) {
      return b & 0xFFFF;
    };
    window.CSLittle32ToNative = function(b) {
      return b & 0xFFFFFFFF;
    };
  }
}).call(this);
