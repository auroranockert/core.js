(function() {
  window.alloc = function(n) {
    return new ArrayBuffer(n);
  };
  window.memcpy = function(dst, src, n) {
    var destination, source, _ref;
    _ref = [new Uint8Array(dst, 0, n), new Uint8Array(src, 0, n)], destination = _ref[0], source = _ref[1];
    destination.set(source);
    return dst;
  };
  window.memcpy2 = function(dst, dstOffset, src, srcOffset, n) {
    var destination, source, _ref;
    _ref = [new Uint8Array(dst, dstOffset, n), new Uint8Array(src, srcOffset, n)], destination = _ref[0], source = _ref[1];
    destination.set(source);
    return dst;
  };
  ArrayBuffer.prototype.realloc = function(n) {
    return memcpy(new ArrayBuffer(n), this, this.byteLength);
  };
}).call(this);
